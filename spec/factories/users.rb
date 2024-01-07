# spec/factories/products.rb
# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    fullname { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { 'password1' }
    password_confirmation { 'password1' }
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/avatar.png')) }
  end
end
