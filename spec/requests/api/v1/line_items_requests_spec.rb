# spec/requests/api/v1/line_items_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::LineItems', type: :request do
  let!(:user) { create :user }
  let(:product) { create :product }

  # current_user
  before { sign_in user }

  let(:cart) { create :cart, user_id: user.id }

  describe 'POST api/v1/line_items' do
    let(:params) { { cart_id: cart.id, product_id: product.id } }

    subject { post api_v1_line_items_path, params: params }

    it 'create LineItem' do
      expect { subject }.to change { LineItem.count }.by(1)
      expect(response).to have_http_status(201)
    end

    context 'add this item to cart again' do
      let(:expected_response) { { 'quantity' => 2 } }
      let!(:item) do
        create :line_item, cart_id: cart.id, product_id: product.id
      end

      it 'quantity++' do
        expect { subject }.not_to(change { LineItem.count })
        expect(response).to have_http_status(200)

        json_response = JSON.parse(response.body)
        expect(json_response['data']['attributes']).to include(expected_response)
      end
    end
  end

  describe 'POST api/v1/line_items/:id/add' do
    let!(:item) do
      create :line_item, cart_id: cart.id, product_id: product.id, quantity: 4
    end

    let(:params) { { id: item.id } }

    subject { post api_v1_line_item_add_path(params) }

    it 'add quantity' do
      expect { subject }.to change { item.reload.quantity }.to(5)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST api/v1/line_items/:id/reduce' do
    let!(:item) do
      create :line_item, cart_id: cart.id, product_id: product.id, quantity: 4
    end

    let(:params) { { id: item.id } }

    subject { post api_v1_line_item_reduce_path(params) }

    it 'reduce quantity' do
      expect { subject }.to change { item.reload.quantity }.to(3)
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE api/v1/line_items/:id' do
    let!(:item) do
      create :line_item, cart_id: cart.id, product_id: product.id
    end

    let(:params) { { id: item.id } }

    subject { delete api_v1_line_item_path(params) }

    it 'delete item' do
      expect { subject }.to change { LineItem.count }.by(-1)
      expect(response).to have_http_status(200)
    end
  end
end
