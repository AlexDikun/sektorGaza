# spec/factories/categories.rb
# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { FFaker::Music.genre }
    description { FFaker::Book.description }
  end
end
