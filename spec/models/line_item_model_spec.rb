# spec/models/line_item_model_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it { is_expected.to belong_to :product }
  it { is_expected.to belong_to :cart }
  it { is_expected.to validate_presence_of(:product_id) }
  it { is_expected.to validate_presence_of(:cart_id) }
  it { is_expected.to validate_numericality_of(:quantity).is_other_than(0) }

  context 'validation total_price' do
    let(:user)    { create :user }
    let(:product) { create :product, price: 100 }
    let(:cart)    { create :cart, user_id: user.id }

    let(:item) do
      create :line_item, cart_id: cart.id, product_id: product.id, quantity: 5
    end

    let(:expected_price) { 500 }

    subject { item.total_price }

    it { is_expected.to eq(expected_price) }
  end
end
