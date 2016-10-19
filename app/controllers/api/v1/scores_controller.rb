module Api::V1 
  class ScoresController < ApplicationController
    def index
      @top_scores = Score.where(text_id: params[:text_id])
                         .order(wpm: :desc)
                         .limit(5)

      render json: @top_scores
    end

    def create
      @score = Score.new(score_params)

      if @score.save
        render json: @score, status: :created
      else
        render json: @score.errors, status: :unprocessable_entity
      end
    end

    private

    def score_params
      params.require(:score).permit(:username, :text_id, :wpm, :time, :accuracy)
    end
  end
end
