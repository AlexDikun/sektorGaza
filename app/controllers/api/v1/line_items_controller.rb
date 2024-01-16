# app/controllers/api/v1/line_items_controller.rb
# frozen_string_literal: true

class Api::V1::LineItemsController < Api::V1::BaseController
    before_action :authenticate_user!, only: :create
  
    # POST api/v1/line_items
    def create; end
  end