class V1::AuthenticationController < ApplicationController

  skip_before_action :authorize_request, only: :authenticate

  # return auth token once user is authenticated
  # GET : /v1/login
  def authenticate
    auth_token =
      AuthenticateUser.new(auth_params[:slug], auth_params[:email], auth_params[:password]).call
    render json: {
      auth_token: auth_token
    }
  end

  private

  def auth_params
    params.permit(:slug, :email, :password)
  end
end