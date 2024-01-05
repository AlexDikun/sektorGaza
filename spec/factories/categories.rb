# spec/factories/categories.rb
# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { FFaker::Music.genre }
    description { FFaker::Lorem.sentence }
  end
end
