# app/controllers/api/v1/line_items_controller.rb
# frozen_string_literal: true

class Api::V1::LineItemsController < Api::V1::BaseController
  before_action :authenticate_user!, only: %i[create destroy]

  # POST api/v1/line_items
  def create
    @product = Product.find(params[:product_id])
    if current_user.products.include?(@product)
      @line_item = current_user.line_items.find_by(product_id: @product.id)
      @line_item.quantity += 1
      render json: LineItemSerializer.new(@line_item, include: [:product])
                                     .serializable_hash.to_json, status: :ok, code: '200'
    else
      @line_item = LineItem.create(user_id: current_user.id,
                                   product_id: @product.id, quantity: 1)
      if @line_item.save
        render json: LineItemSerializer.new(@line_item, include: [:product])
                                       .serializable_hash.to_json, status: :created, code: '201'
      else
        render jsonapi_errors: @line_item.errors,
               status: :unprocessable_entity, code: '422'
      end
    end
  end

  # DELETE api/v1/line_items/:id
  def destroy
    @line_item = LineItem.find(params[:id])
    if @line_item.destroy
      render jsonapi: @line_item, status: :ok, code: '200'
    else
      render jsonapi_errors: @line_item.errors,
             status: :unprocessable_entity, code: '422'
    end
  end
end
