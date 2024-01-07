# app/controllers/api/v1/users_controller.rb
# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user!, only: %i[update destroy]
  before_action :set_user,           only: %i[update destroy]

  # PATCH/PUT api/v1/users/:id
  def update; end

  # DELETE api/v1/users/:id
  def destroy; end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_update_params
    params.require(:user).permit(:fullname, :avatar)
  end
end
