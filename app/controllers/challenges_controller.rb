class ChallengesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_emp!, only:[:edit, :update, :destroy]
  
  def index
    #  if params[:sortable] == "votes"  
    #     @challenges = Challenge.all.sort_by { |challenge| challenge.votes.count }.reverse   
    #  else
    @challenges = Challenge.order(sort_column+ " " + sort_direction).paginate(page: params[:page], per_page: 5)
    #@challenges2 = Challenge.paginate(page: params[:page], per_page: 5)
  end

 
  def show
  end

  def new
    @challenge = Challenge.new
  end

  
  def edit
  end


  def create
    @challenge = current_emp.challenges.build(title: params[:challenge][:title],description: params[:challenge][:description])

    respond_to do |format|
      if @challenge.save
        tag_string = params[:challenge][:tag]
        tag_array = tag_string.split(",")
        tag_array.each do |tag_name|
          @challenge.tags.create(name: tag_name)
        end
        format.html { redirect_to root_path, notice: 'Challenge was successfully created.' }
        format.json { render :show, status: :created, location: @challenge.tags }
      else
        format.html { render :new }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url, notice: 'Challenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def challenge_params
      params.require(:challenge).permit(:title, :description, :emp_id, :tag)
    end

    def sort_column
      params[:sort] || "title"
    end
    
    def sort_direction
      params[:direction] || "asc"
    end
end
