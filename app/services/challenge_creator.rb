class ChallengeCreator
    def initialize(params)
      @params = params
      @challenge = Challenge
    end
  
    def execute(current_emp)
      @challenge = current_emp.challenges.build(title: @params[:challenge][:title], description: @params[:challenge][:description])
      if @challenge.save
        tag_string = @params[:challenge][:tag]
        @challenge.tags.create(name: tag_string)
      end
      return @challenge
    end
  end