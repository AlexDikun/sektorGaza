# app/controllers/api/v1/line_items_controller.rb
# frozen_string_literal: true

class Api::V1::LineItemsController < Api::V1::BaseController
  before_action :authenticate_user!, only: %i[create add_quantity reduce_quantity destroy]
  before_action :set_line_item, only: %i[add_quantity reduce_quantity destroy]
  before_action :set_cart

  # POST api/v1/line_items
  def create
    @product = Product.find(params[:product_id])
    if @current_cart.products.include?(@product)
      @line_item = @current_cart.line_items.find_by(product_id: @product.id)
      @line_item.quantity += 1
      render json: LineItemSerializer.new(@line_item, include: [:product])
                                     .serializable_hash.to_json, status: :ok, code: '200'
    else
      @line_item = LineItem.create(cart_id: @current_cart.id,
                                   product_id: @product.id)
      if @line_item.save
        render json: LineItemSerializer.new(@line_item, include: [:product])
                                       .serializable_hash.to_json, status: :created, code: '201'
      else
        render jsonapi_errors: @line_item.errors,
               status: :unprocessable_entity, code: '422'
      end
    end
  end

  # POST api/v1/line_items/:id/add
  def add_quantity
    @line_item.quantity += 1
    @line_item.save
    render jsonapi: @line_item, status: :ok, code: '200'
  end

  # POST api/v1/line_items/:id/reduce
  def reduce_quantity
    @line_item.quantity -= 1 if @line_item.quantity > 1
    @line_item.save
    render jsonapi: @line_item, status: :ok, code: '200'
  end

  # DELETE api/v1/line_items/:id
  def destroy
    if @line_item.destroy
      render jsonapi: @line_item, status: :ok, code: '200'
    else
      render jsonapi_errors: @line_item.errors,
             status: :unprocessable_entity, code: '422'
    end
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def set_cart
    @current_cart = Cart.find_by(user_id: current_user.id)
  rescue ActiveRecord::RecordNotFound
    @current_cart = Cart.create(user_id: current_user.id)
  end
end
