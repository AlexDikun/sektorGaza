# app/controllers/api/v1/products_controller.rb
# frozen_string_literal: true

class Api::V1::ProductsController < ApplicationController

  # POST api/v1/products
  def create; end

  # PATCH/PUT api/v1/products/:id
  def update; end

  # DELETE api/v1/products/:id
  def destroy; end

  private

  def product_params
    params.require(:product).permit(:title, :body, :price, :image)
  end
end
