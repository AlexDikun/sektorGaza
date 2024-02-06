# frozen_string_literal: true

# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  content    :text             default(""), not null
#  rating     :integer          not null
#  user_id    :bigint           not null
#  product_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# spec/factories/reviews.rb

FactoryBot.define do
  factory :review do
    content { FFaker::Lorem.sentence }
    rating { rand(1..5) }
    association :user
    association :product
  end
end
