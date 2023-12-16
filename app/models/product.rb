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
  include ImageUploader::Attachment(:image)

  validates :title, :body, :image, presence: true
  validates :price, numericality: { other_than: 0 }, presence: true
end
