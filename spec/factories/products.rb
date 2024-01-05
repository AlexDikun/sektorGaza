# spec/factories/products.rb
# frozen_string_literal: true

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
