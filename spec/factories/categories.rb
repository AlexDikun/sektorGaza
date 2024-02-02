# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# spec/factories/categories.rb

FactoryBot.define do
  factory :category do
    name { FFaker::Music.genre }
    description { FFaker::Lorem.sentence }
  end
end
