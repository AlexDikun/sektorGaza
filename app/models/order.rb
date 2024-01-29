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
#

# app/models/order.rb
# frozen_string_literal: true

class Order < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :address, presence: true, length: { maximum: 200 }
  validates :telephone_number, presence: true, length: { maximum: 18 }

  has_many :line_items, dependent: :destroy
end
