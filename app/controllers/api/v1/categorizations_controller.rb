# app/controllers/api/v1/categorizations_controller.rb
# frozen_string_literal: true

class Api::V1::CategorizationsController < Api::V1::BaseController
  # POST route
  def create; end

  # DELETE api/v1/categorizations/:id
  def destroy
    @categorization = Categorization.find(params[:id])
    if @categorization.destroy
      render jsonapi: @categorization, status: :ok, code: '200'
    else
      render jsonapi_errors: @categorization.errors,
             status: :unprocessable_entity, code: '422'
    end
  end
end
