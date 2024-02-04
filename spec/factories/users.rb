# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  fullname           :string
#  avatar_data        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  email              :string           default(""), not null
#  encrypted_password :string           default(""), not null
#
# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    fullname { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { 'password1' }
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/avatar.png')) }

    trait(:with_invalid_avatar) do
      avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/avatar.tiff')) }
    end
  end
end
