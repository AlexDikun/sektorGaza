# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null

# app/models/category.rb
# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :categorizations
  has_many :products, through: :categorizations

  validates :name, presence: true, length: { maximum: 30 }
  validates :name, uniqueness: true
  validates :description, length: { maximum: 100 }
end
