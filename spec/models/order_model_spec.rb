# spec/models/order_model_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(30) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_length_of(:address).is_at_most(200) }
  it { is_expected.to validate_presence_of(:telephone_number) }
  it { is_expected.to validate_length_of(:telephone_number).is_at_most(18) }
  it { is_expected.to have_many(:line_items).dependent(:destroy) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:user_id) }
end
