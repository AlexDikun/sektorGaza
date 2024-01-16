# app/controllers/api/v1/registrations_controller.rb
# frozen_string_literal: true

class Api::V1::RegistrationsController < Devise::RegistrationsController
  # POST api/v1/signup
  def create
    build_resource(sign_up_params)
    resource.skip_avatar_validation = true
    resource.save

    if resource.persisted?
      sign_up(resource_name, resource)
      render jsonapi: resource, status: 200
    else
      render jsonapi_errors: resource.errors, status: 400
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :fullname)
  end
end
