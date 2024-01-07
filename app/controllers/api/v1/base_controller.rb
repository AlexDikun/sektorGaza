# app/controllers/api/v1/base_controller.rb
# frozen_string_literal: true

class Api::V1::BaseController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[fullname bio avatar])
  end

  def after_sign_in_path_for(_user)
    api_v1_catalog_index
  end

  private

  def authenticate_account!
    if account_signed_in?
      super
    else
      new_api_v1_user_session
    end
  end
end
