# app/controllers/api/v1/categories_controller.rb
# frozen_string_literal: true

class Api::V1::CategoriesController < Api::V1::BaseController
  before_action :set_category, only: %i[update destroy]

  # POST api/v1/categories
  def create
    @category = Category.new(category_params)
    if @category.save
      render jsonapi: @category, status: :created, code: '201'
    else
      render jsonapi_errors: @category.errors,
             status: :unprocessable_entity, code: '422'
    end
  end

  # PATCH/PUT api/v1/categories/:id
  def update
    if @category.update(category_params)
      render jsonapi: @category, status: :ok, code: '200'
    else
      render jsonapi_errors: @category.errors,
             status: :unprocessable_entity, code: '422'
    end
  end

  # DELETE api/v1/categories/:id
  def destroy
    if @category.destroy
      render jsonapi: @category, status: :ok, code: '200'
    else
      render jsonapi_errors: @category.errors,
             status: :unprocessable_entity, code: '422'
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
