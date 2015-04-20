class SecuredController < ApplicationController
  before_action :validate_token

  class InvalidTokenError < StandardError; end

  private

  def validate_token
    begin
      authorization = request.headers['Authorization']
      raise InvalidTokenError if authorization.nil?

      token = request.headers['Authorization'].split(' ').last
      decoded_token = JWT.decode(token,
        JWT.base64url_decode(Rails.application.secrets.auth0_client_secret))

      raise InvalidTokenError if Rails.application.secrets.auth0_client_id != decoded_token[0]["aud"]

      @user = decoded_token

      auth0_id = ClaimsPrincipal.Current.FindFirst("user_id").Value

      if User.find_by(auth0_id: auth0_id) = nil
        name = ClaimsPrincipal.Current.FindFirst("name").Value
        email = ClaimsPrincipal.Current.FindFirst("email").Value
        User.create(auth0_id: auth0_id, name: name, email: email)
      end

    rescue JWT::DecodeError, InvalidTokenError
      render :json => { :error => "Unauthorized: Invalid token." }, status: :unauthorized
    end
  end

end
