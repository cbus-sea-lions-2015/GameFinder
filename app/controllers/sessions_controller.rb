class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      @user.set_auth_token
      render json: {'token' => @user.auth_token}.to_json
    end
  end

  def destroy
    @user.auth_token.clear
    redirect_to root_path
  end

end
