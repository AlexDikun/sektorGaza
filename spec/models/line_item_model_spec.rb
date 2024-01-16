# spec/models/line_item_model_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it { is_expected.to belong_to :product }
  it { is_expected.to belong_to :user }
  it { is_expected.to validate_presence_of(:product_id) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_numericality_of(:quantity).is_other_than(0) }
end
