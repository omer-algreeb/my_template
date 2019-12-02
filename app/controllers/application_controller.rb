class ApplicationController < ActionController::API

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end

  # Set request locale
  def set_locale
    I18n.locale = params[:locale] || request.headers['locale'] || I18n.default_locale
  end
end
