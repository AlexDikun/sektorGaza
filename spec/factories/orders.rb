# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id               :bigint           not null, primary key
#  name             :string
#  telephone_number :string
#  address          :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint
#
# spec/factories/orders.rb

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
