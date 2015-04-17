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
    @user = User.new(user_params)
    if @user.save
      render json: {'token' => @user.auth_token}.to_json
    end
  end

  def show
    render json: @user.to_json
    # @user = User.find(session[:user_id])
  end

  # def edit
  #   @user = User.find(session[:user_id])
  # end

  # def update
  #   @user = User.find(session[:user_id])
  #   if @user.update_attributes(profile_params)
  #     redirect_to profile_path
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @user = User.find(session[:user_id])
  #   @user.destroy
  #   session.delete(:user_id)
  #   redirect_to root_path
  # end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end

    # def profile_params
    #   params.require(:user).permit(:email, :password, :name, :phone, :handle, :bgg_username)
    # end

end
