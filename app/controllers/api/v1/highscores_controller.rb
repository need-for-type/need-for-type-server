module Api::V1
  class HighscoresController < ApplicationController

    # GET /highscores
    #
    # limit (optional) - limit the number of top highscores
    # username (optional) - get a specific score of a user
    def index
      debugger
      limit = params[:limit] || 5
      response_params = {}
      response_params[:highscores] = Highscore.get_top(limit)

      if params[:username]
        response_params[:user] = Highscore.get_above_me_count(params[:username])
      end

      render json: response_params
    end

    # POST /highscores
    def create
      @highscore = Highscore.new(highscore_params)

      if @highscore.save
        render json: @highscore, status: :created
      else
        render json: { message: @highscore.errors.full_messages.join(', ') },
          status: :unprocessable_entity
      end
    end

    private

    def highscore_params
      params.require(:highscore).permit(:username, :wpm, :accuracy)
    end
  end
end
