# app/controllers/api/v1/orders_controller.rb
# frozen_string_literal: true

class Api::V1::OrdersController < Api::V1::BaseController
  before_action :authenticate_user!, only: %i[show create]

  # GET api/v1/orders/:id
  def show; end

  # POST api/v1/orders
  def create; end
end
