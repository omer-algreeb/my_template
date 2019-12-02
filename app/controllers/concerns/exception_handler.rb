# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  # included do
  #   # Handle all exceptions
  #   rescue_from StandardError,                      with: :server_error!
  #   rescue_from I18n::InvalidLocale,                with: :i18n_invalid_locale!
  #   rescue_from Consul::Powerless,                  with: :consul_powerless!
  #   rescue_from ActiveRecord::RecordNotFound,       with: :record_not_found!
  # end

  # The message of record not found, can be customized by override it to the controllers
  def record_not_found_message
    resource_name&.present? ? I18n.t(:x_not_found, name: resource_name&.singularize&.titleize) : I18n.t(:not_found)
  end

   # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    # Define custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end
  end

  protected

  # Handle I18n::InvalidLocale
  def i18n_invalid_locale!
    render_unauthorized(error: 1004, params: params[:locale])
  end

  # Handle Consul::Powerless
  def consul_powerless!
    render_forbidden
  end

  # Handle ActiveRecord::RecordNotFound
  def record_not_found!
    render_not_found(message: record_not_found_message)
  end

  # Handle StandardError
  def server_error!(err)
    Rails.logger.error(err.message)

    err.backtrace.each do |line|
      Rails.logger.error(line)
    end

    unless Rails.env.production?
      data = {
        error: err.message,
        backtrace: err.backtrace
      }
    end

    render_bad_request(error: 1000, data: data || {})
  end

  def four_twenty_two(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end

  # JSON response with message; Status code 401 - Unauthorized
  def unauthorized_request(e)
    json_response({ message: e.message }, :unauthorized)
  end
end
