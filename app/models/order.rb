# == Schema Information
#
# Table name: orders
#
#  id               :bigint           not null, primary key
#  name             :string
#  telephone_number :string
#  address          :text
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

# app/models/order.rb
# frozen_string_literal: true

class Order < ApplicationRecord
end
