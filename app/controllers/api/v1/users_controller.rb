# app/controllers/api/v1/users_controller.rb
# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user!, only: %i[update destroy]

  # PATCH/PUT api/v1/users/:id
  def update; end
  
  # DELETE api/v1/users/:id
  def destory; end
end
