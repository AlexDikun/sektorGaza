# app/controllers/api/v1/orders_controller.rb
# frozen_string_literal: true

class Api::V1::OrdersController < Api::V1::BaseController
  before_action :authenticate_user!, only: %i[show create]
  before_action :set_cart, only: :create
  before_action :set_order, only: :show

  # GET api/v1/orders/:id
  def show
    render json: OrderSerializer.new(@order, include: [:line_items])
                                .serializable_hash.to_json, status: :ok, code: '200'
  end

  # POST api/v1/orders
  def create
    @order = Order.new(order_params)

    @current_cart.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    end

    if @order.save
      render jsonapi: @order, status: :created, code: '201'
    else
      render jsonapi_errors: @order.errors,
             status: :unprocessable_entity, code: '422'
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :telephone_number, :address)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
