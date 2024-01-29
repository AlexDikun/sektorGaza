# spec/models/cart_model_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many(:line_items).dependent(:destroy) }
  it { is_expected.to have_many(:products).through(:line_items) }

  context 'validation total_coast' do
    let(:user)    { create :user }
    let(:cart)    { create :cart, user_id: user.id }

    let(:instrument) { create :product, price: 100 }
    let(:accessory)  { create :product, price: 50  }

    let!(:first_item) do
      create :line_item, cart_id: cart.id, product_id: instrument.id, quantity: 1
    end

    let!(:second_item) do
      create :line_item, cart_id: cart.id, product_id: accessory.id, quantity: 2
    end

    let(:expected_coast) { 200 }

    subject { cart.total_coast }

    it { is_expected.to eq(expected_coast) }
  end
end
