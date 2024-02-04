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

# spec/models/review_model_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  subject { build(:review) }

  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_length_of(:content).is_at_most(500) }
  it { is_expected.to validate_presence_of(:rating) }
  it { is_expected.to validate_inclusion_of(:rating).in_range(1..5) }
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :product }
  it { is_expected.to validate_presence_of :user_id }
  it { is_expected.to validate_presence_of :product_id }
  it do
    should validate_uniqueness_of(:user_id)
      .scoped_to(:product_id).case_insensitive
  end
end
