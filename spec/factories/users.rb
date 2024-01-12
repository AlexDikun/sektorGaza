# spec/factories/users.rb
# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { 'password1' }
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/avatar.png')) }

    trait(:with_invalid_avatar) do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/avatar.tiff')) }
    end
  end
end