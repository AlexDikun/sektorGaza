# spec/requests/api/v1/orders_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Orders', type: :request do
  context 'place an order' do
    let(:user) { create :user }
    let(:cart) { create :cart, user_id: user.id }
    let(:product) { create :product }
    let!(:item) { create :line_item, cart_id: cart.id, product_id: product.id }

    before { sign_in user }

    describe 'POST api/v1/orders' do
      let(:params) { { order: attributes_for(:order) } }
      subject { post api_v1_orders_path, params: params }

      it 'create order' do
        expect { subject }.to change { Order.count }.by(1)
        expect(response).to have_http_status(201)
      end
    end
  end
end
