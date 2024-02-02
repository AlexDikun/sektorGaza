# spec/factories/orders.rb
# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    name { FFaker::NameRU.name }
    telephone_number { FFaker::PhoneNumberRU.international_phone_number }
    address { FFaker::AddressRU.street_address }
    association :user

    factory :order_with_line_items do
      after(:create) do |order|
        create(:line_item, order: order, product: create(:product))
      end
    end
  end
end
