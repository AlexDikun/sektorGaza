# spec/factories/orders.rb
# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    name { FFaker::NameRU.name }
    telephone_number { FFaker::PhoneNumberRU.international_phone_number }
    address { FFaker::AddressRU.street_address }
  end
end
