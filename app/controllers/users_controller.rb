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
    user.name = params["name"] if params["name"]
    user.save
    render json: user.to_json
  end

  def show
    user = User.find(auth0_id: params[:auth0_id])
    render json: user.to_json
  end

  def update
    user = User.find_by(auth0_id: params[:auth0_id])
    user.update(params)
    render json: user.to_json
  end

end
