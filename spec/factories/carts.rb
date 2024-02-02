# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# spec/factories/carts.rb

FactoryBot.define do
  factory :cart do
    association :user
  end
end
