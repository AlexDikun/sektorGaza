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

  has_many :category_categorizations, foreign_key: :category_id, class_name: 'Categorization'
  has_many :categories, through: :category_categorizations, source: :category

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 500 }
  validates :price, numericality: { other_than: 0 }, presence: true
  validates :image, presence: true
end
