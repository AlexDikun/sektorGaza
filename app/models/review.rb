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
end
