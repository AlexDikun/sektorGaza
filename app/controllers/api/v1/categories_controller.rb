# app/controllers/api/v1/categories_controller.rb
# frozen_string_literal: true

class Api::V1::CategoriesController < ApplicationController
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
    @category = Category.find(params[:id])
    if @category.update(category_params)
      render jsonapi: @category, status: :ok, code: '200'
    else
      render jsonapi_errors: @category.errors,
             status: :unprocessable_entity, code: '422'
    end
  end

  # DELETE api/v1/categories/:id
  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      render jsonapi: @category, status: :ok, code: '200'
    else
      render jsonapi_errors: @category.errors,
             status: :unprocessable_entity, code: '422'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
