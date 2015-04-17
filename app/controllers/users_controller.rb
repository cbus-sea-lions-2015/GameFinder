class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:index, :new, :create]

  def index
    # users = User.all
    # render json: users, status: 200
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {'token' => @user.auth_token}.to_json
    end
  end

  def show
    render json: @user.to_json
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end

end
