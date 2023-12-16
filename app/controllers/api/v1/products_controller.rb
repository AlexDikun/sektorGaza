# app/controllers/api/v1/products_controller.rb
# frozen_string_literal: true

class Api::V1::ProductsController < ApplicationController
  # POST api/v1/products
  def create
    @product = Product.new(product_params)
    @product.image_derivatives! if @product.valid?
    if @product.save
      render jsonapi: @product, status: :created, code: '201'
    else
      render jsonapi_errors: @product.errors,
             status: :unprocessable_entity, code: '422'
    end
  end

  # PATCH/PUT api/v1/products/:id
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      @product.image_derivatives! if @product.valid?
      @product.save
      render jsonapi: @product, status: :ok, code: '200'
    else
      render jsonapi_errors: @product.errors,
             status: :unprocessable_entity, code: '422'
    end
  end

  # DELETE api/v1/products/:id
  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      render jsonapi: @product, status: :ok, code: '200'
    else
      render jsonapi_errors: @product.errors,
             status: :unprocessable_entity, code: '422'
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :body, :price, :image)
  end
end
