class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_emp!, only:[:edit, :update, :destroy]
  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.order(params[:sort])
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges
  # POST /challenges.json
  def create
    #@challenge = Challenge.new(challenge_params)
    @challenge = current_emp.challenges.build(title: params[:challenge][:title],description: params[:challenge][:title])

    respond_to do |format|
      if @challenge.save
        tag_string = params[:challenge][:tag]
        tag_array = tag_string.split(",")
        tag_array.each do |tag_name|
          @challenge.tags.create(name: tag_name)
        end
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
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
end
