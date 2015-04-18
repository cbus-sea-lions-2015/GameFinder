class GamesController < ApplicationController
  skip_before_action :authenticate
  def show
    game = Game.find(params[:id])

    render json: game.to_json
  end
end
