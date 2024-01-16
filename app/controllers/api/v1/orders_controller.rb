# app/controllers/api/v1/orders_controller.rb
# frozen_string_literal: true

class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[show create]

  # GET api/v1/users/:user_id/orders/:id
  def show; end

  # POST api/v1/users/:user_id/orders
  def create; end
end
