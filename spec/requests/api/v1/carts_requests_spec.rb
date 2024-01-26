# spec/requests/api/v1/carts_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Carts', type: :request do
  let(:user) { create :user }
  let!(:cart) { create :cart, user_id: user.id }
  let(:params) { { id: cart.id } }

  before { sign_in user }

  describe 'GET api/v1/carts/:id' do
    let(:product) { create :product }
    let!(:item) do
      create :line_item, cart_id: cart.id, product_id: product.id
    end

    let(:expected_response) { { 'title' => product.title } }

    subject { get api_v1_cart_path(params) }

    it 'show cart' do
      subject
      expect(response).to have_http_status(200)

      json_response = JSON.parse(response.body)
      expect(json_response['included'].second['attributes'])
        .to include(expected_response)
    end
  end

  describe 'DELETE api/v1/carts/:id' do
    subject { delete api_v1_cart_path(params) }

    it 'delete cart' do
      expect { subject }.to change { Cart.count }.by(-1)
      expect(response).to have_http_status(200)
    end
  end
end
