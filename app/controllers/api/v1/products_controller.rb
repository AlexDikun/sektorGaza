# app/controllers/api/v1/products_controller.rb
# frozen_string_literal: true

class Api::V1::ProductsController < ApplicationController
  def create; end

  def update; end

  def destroy; end

  private

  def product_params
    params.require(:product).permit(:title, :body, :price, :image)
  end
end
