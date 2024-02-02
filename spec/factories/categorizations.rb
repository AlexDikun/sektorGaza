# frozen_string_literal: true

# == Schema Information
#
# Table name: categorizations
#
#  id          :bigint           not null, primary key
#  category_id :integer
#  product_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# spec/factories/categorizations.rb

FactoryBot.define do
  factory :categorization do
    association :category
    association :product
  end
end
