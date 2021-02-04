class VotesController < ApplicationController
    before_action :authenticate_emp!

    def create
        @vote = current_emp.votes.build(vote_params)
        @challenge =@vote.challenge
        if current_emp.id != @challenge.emp.id
            if @vote.save
                #flash[:notice]="voted"
                redirect_to root_path 
                flash[:success]= "Voted"
            else 
                flash[:danger] = "something went wrong"
            end
        else
            redirect_to root_path 
            flash[:notice]= "You cannot upvote your challenge"
        end
    end

    def destroy
        @vote =Vote.find(params[:id])
        @post = @vote.challenge
        if @vote.destroy
            #flash[:notice]="vote deleted"
            redirect_to root_path notice: "Downvoted"
        else
            flash[:notice]= "Somethign went wrong"
        end
    end
    
    private

    def vote_params
        params.permit :challenge_id
    end
end
