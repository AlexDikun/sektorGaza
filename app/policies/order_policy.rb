# app/policies/order_policy.rb
# frozen_string_literal: true

class OrderPolicy
  attr_reader :current_user, :order

  def initialize(current_user, order)
    @user = current_user
    @cart = @user.cart
    @order = order
  end

  def create?
    @cart.line_items.any?
  end

  def show?
    @user.orders.where(id: order.id).exists?
  end
end
