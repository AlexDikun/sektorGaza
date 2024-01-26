# app/controllers/api/v1/carts_controller.rb
# frozen_string_literal: true

class Api::V1::CartsController < Api::V1::BaseController
  before_action :authenticate_user!, only: %i[show destroy]
  before_action :set_cart,           only: %i[show destroy]

  # GET api/v1/carts/:id
  def show
    render json: CartSerializer.new(@current_cart, include: %i[line_items products])
                               .serializable_hash.to_json, status: :ok, code: '200'
  end

  # DELETE api/v1/carts/:id
  def destroy
    if @current_cart.destroy
      render jsonapi: @current_cart, status: :ok, code: '200'
    else
      render jsonapi_errors: @current_cart.errors,
             status: :unprocessable_entity, code: '422'
    end
  end
end
