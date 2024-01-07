# app/controllers/api/v1/users_controller.rb
# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user!, only: %i[update destroy]
  before_action :set_user,           only: %i[update destroy]

  # PATCH/PUT api/v1/users/:id
  def update
    if @user.update(user_update_params)
      if @user.avatar
        @user.avatar_derivatives!
        @user.save
      end
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
    params.require(:user).permit(:fullname, :avatar)
  end
end
