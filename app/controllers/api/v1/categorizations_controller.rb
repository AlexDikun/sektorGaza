# app/controllers/api/v1/categorizations_controller.rb
# frozen_string_literal: true

class Api::V1::CategorizationsController < Api::V1::BaseController
  # POST api/v1/categorizations
  def create
    @category = Category.find(params[:category_id])
    @product = Product.find(params[:product_id])
    @categorization = Categorization.create(category_id: @category.id, product_id: @product.id)
    if @categorization.save
      render jsonapi: @categorization, status: :created, code: '201'
    else
      render jsonapi_errors: @categorization.errors,
             status: :unprocessable_entity, code: '422'
    end
  end

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
