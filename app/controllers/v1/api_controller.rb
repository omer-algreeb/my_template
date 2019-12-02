# frozen_string_literal: true

class V1::ApiController < ApplicationController
  include JsonResponders
  include ExceptionHandler
  include MissingData
  # include Consul::Controller

  before_action :set_locale
  # require_power_check
  before_action :authorize_request
  attr_reader :current_user

  # self.responder = ApplicationResponder

  # Set Power and inject it with current user
  # current_power do
  #   Power.new(current_user)
  # end
# called before every action on controllers


end
