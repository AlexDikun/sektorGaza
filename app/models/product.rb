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

# app/models/product.rb
# frozen_string_literal: true

class Product < ApplicationRecord
    validates :title, :body, :price, presence: true
end
