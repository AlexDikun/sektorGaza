# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  title      :string
#  body       :text
#  price      :decimal(, )
#  image_data :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# spec/factories/products.rb

FactoryBot.define do
  factory :product do
    title { FFaker::Product.product_name }
    body { FFaker::Product.product }
    price { FFaker::Number.decimal }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/product_image.webp')) }

    trait(:with_invalid_image) do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/product_image.txt')) }
    end
  end
end
