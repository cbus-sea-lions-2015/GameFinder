class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate

  # def current_user
  #   @user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  # helper_method :current_user

  # def logged_in?
  #   !!current_user
  # end
  # helper_method :logged_in?

  # def authenticate
  #   unless logged_in?
  #     redirect_to new_sessions_path, alert: "Please log in."
  #     return false
  #   end
  # end

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_or_request_with_http_token do |token, options|
      @user = User.find_by(auth_token: token)
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: 'Bad credentials', status: 401
  end

end
