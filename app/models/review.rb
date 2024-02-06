# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  content    :text             default(""), not null
#  rating     :integer          not null
#  user_id    :bigint           not null
#  product_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# app/models/review.rb
# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :content, presence: true, length: { maximum: 500 }
  validates :rating, presence: true
  validates_inclusion_of :rating, in: 1..5
  validates :user_id, presence: true, uniqueness: { scope: :product_id }
  validates :product_id, presence: true
end
