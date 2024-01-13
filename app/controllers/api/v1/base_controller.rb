# app/controllers/api/v1/base_controller.rb
# frozen_string_literal: true

class Api::V1::BaseController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[fullname])
  end
end
