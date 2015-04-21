class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:index, :new, :create]

  def index
    users = User.all
    render json: users, status: 200
  end

  def new
    @user = User.new
  end

  def create
    user = User.find_or_initialize_by(auth0_id: params["token"])
    render json: user.to_json
  end

  def show
    render json: @user.to_json
  end

end
