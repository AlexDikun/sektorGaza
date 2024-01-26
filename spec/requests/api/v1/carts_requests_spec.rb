# spec/requests/api/v1/carts_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Carts', type: :request do
  let(:user) { create :user }
  let!(:cart) { create :cart, user_id: user.id }

  before { sign_in user }

  describe 'DELETE api/v1/carts/:id' do
    let(:params) { { id: cart.id } }

    subject { delete api_v1_cart_path(params) }

    it 'delete cart' do
      expect { subject }.to change { Cart.count }.by(-1)
      expect(response).to have_http_status(200)
    end
  end
end
