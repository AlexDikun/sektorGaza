# app/controllers/api/v1/base_controller.rb
# frozen_string_literal: true

class Api::V1::BaseController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[fullname])
  end

  private

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, format: :json
    end
  end

  def set_cart
    @current_cart = Cart.find_by(user_id: current_user.id)
  rescue ActiveRecord::RecordNotFound
    @current_cart = Cart.create(user_id: current_user.id)
  end
end
