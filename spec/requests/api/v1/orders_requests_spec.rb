# spec/requests/api/v1/orders_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Orders', type: :request do
  let(:user) { create :user }
  before { sign_in user }

  context 'place an order' do
    let(:cart) { create :cart, user_id: user.id }
    let(:product) { create :product }

    describe 'POST api/v1/orders' do
      let(:params) { { order: attributes_for(:order) } }
      subject { post api_v1_orders_path, params: params }

      context 'Happy path' do
        let!(:item) { create :line_item, cart: cart, product: product }

        it 'create order' do
          expect { subject }.to change { Order.count }.by(1)
          expect(response).to have_http_status(201)
        end
      end

      context 'if a shopping cart is empty' do
        let!(:cart) { create :cart, user_id: user.id }

        it { expect { subject }.to raise_error Pundit::NotAuthorizedError }
      end
    end
  end

  describe 'GET api/v1/orders/:id' do
    let!(:order) { create :order_with_line_items, user: user }
    let(:params) { { id: order.id } }
    let(:expected_contact) { { 'telephone_number' => order.telephone_number } }
    let(:expected_purchase) { { 'title' => order.products.first.title } }

    subject { get api_v1_order_path(params) }

    it 'show order' do
      subject
      expect(response).to have_http_status(200)

      json_response = JSON.parse(response.body)
      expect(json_response['data']['attributes'])
        .to include(expected_contact)
      expect(json_response['included'].first['attributes'])
        .to include(expected_purchase)
    end
  end
end
