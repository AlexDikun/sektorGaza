# app/policies/review_policy.rb
# frozen_string_literal: true

class ReviewPolicy
  attr_reader :current_user, :review

  def initialize(current_user, review)
    @user = current_user
    @review = review
  end

  def create?
    @user.orders.includes(:products).where(id: review.product.id).exists?
  end

  def update?
    @user.reviews.where(id: review.id).exists?
  end

  def destroy?
    @user.reviews.where(id: review.id).exists?
  end
end
