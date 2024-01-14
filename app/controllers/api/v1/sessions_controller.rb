# app/controllers/api/v1/sessions_controller.rb
# frozen_string_literal: true

class Api::V1::SessionsController < Devise::SessionsController
  private

  def respond_with(resource, _opts = {})
    if resource.errors.empty?
      render jsonapi: resource, status: 200
    else
      render jsonapi_errors: resource.errors, status: 400
    end
  end

  def respond_to_on_destroy
    head :no_content
  end
end
