# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# app/models/cart.rb
# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
end
