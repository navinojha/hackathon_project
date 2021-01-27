class CollaborationsController < ApplicationController
    before_action :authenticate_emp!

    def create
        @collaboration = current_emp.collaborations.build(collaboration_params)
        @challenge =@collaboration.challenge
        if current_emp.id != @challenge.emp.id
            if @collaboration.save
                #flash[:notice]="voted"
                redirect_to root_path 
                flash[:notice] = "Collaborated"
            else 
                flash[:notice] = "something went wrong"
            end
        else
            redirect_to root_path 
            flash[:notice] =  "You cannot collaborate your challenge"
        end
    end

    def destroy
        @collaboration =Collaboration.find(params[:id])
        @post = @collaboration.challenge
        if @collaboration.destroy
            #flash[:notice]="vote deleted"
            redirect_to root_path notice: "Collaboration Declined"
        else
            flash[:notice]= "Somethign went wrong"
        end
    end
    
    private

    def collaboration_params
        params.permit :challenge_id
    end
end
