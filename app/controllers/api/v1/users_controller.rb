# app/controllers/api/v1/users_controller.rb
# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: %i[show update destroy]

  # GET api/v1/users/:id
  def show
    render jsonapi: @user
  end

  # PATCH/PUT api/v1/users/:id
  def update
    if @user.update(user_update_params)
      @user.avatar_derivatives! && @user.save if @user.avatar
      render jsonapi: @user, status: :ok, code: '200'
    else
      render jsonapi_errors: @user.errors,
             status: :unprocessable_entity, code: '422'
    end
  end

  # DELETE api/v1/users/:id
  def destroy
    if @user.destroy
      render jsonapi: @user, status: :ok, code: '200'
    else
      render jsonapi_errors: @user.errors,
             status: :unprocessable_entity, code: '422'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_update_params
    params.require(:user).permit(:fullname, :email, :avatar)
  end
end
