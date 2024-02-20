# app/policies/user_policy.rb
# frozen_string_literal: true

class UserPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @account_owner = current_user
    @user = user
  end

  def update?
    @account_owner.eql?(@user)
  end

  def destroy?
    @account_owner.eql?(@user)
  end
end
