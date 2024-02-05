# spec/requests/api/v1/reviews_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

describe 'Api::V1::Reviews', type: :request do
  let(:user) { create :user }
  let(:order) { create :order_with_line_items, user: user }

  describe 'GET api/v1/products/:product_id/reviews' do
    let(:review) { create :review, user: user, product: order.products.first }
    let(:params) { { product_id: order.products.first.id } }
    let(:expected_count) { Review.all.count }

    subject { get api_v1_product_reviews_path(params) }

    it 'index reviews' do
      subject
      expect(response).to have_http_status(200)

      json_response = JSON.parse(response.body)
      expect(json_response['data'].count).to eq(expected_count)
    end
  end

  describe 'GET api/v1/products/:product_id/reviews/:id' do
    let(:review) { create :review, user: user, product: order.products.first }
    let(:params) { { product_id: order.products.first.id, id: review.id } }

    subject { get api_v1_product_review_path(params) }

    let(:expected_attr) { { 'content' => review.content } }

    it 'show review' do
      subject
      expect(response).to have_http_status(200)

      json_response = JSON.parse(response.body)
      expect(json_response['data']['attributes']).to include(expected_attr)
    end
  end

  describe 'POST api/v1/products/:product_id/reviews' do
    before { sign_in user }

    let(:params) { { review: attributes_for(:review) } }
    let(:product_id) { { product_id: order.products.first.id } }

    subject { post api_v1_product_reviews_path(product_id), params: params }

    it 'create review' do
      expect { subject }.to change { Review.count }.by(1)
      expect(response).to have_http_status(201)
    end

    context 'when params invalid' do
      let(:params) do
        { review: { rating: 6 } }
      end

      it 'does not create product' do
        expect { subject }.not_to(change { Review.count })
        expect(response).to have_http_status(422)
      end
    end

    context 'When a user did not purchase the product' do
      let(:another_product) { create :product }
      let(:product_id) { another_product.id }

      it 'violation of usage policy' do
        expect { subject }.to raise_error Pundit::NotAuthorizedError
      end
    end
  end

  describe 'PATCH api/v1/products/:product_id/reviews/:id' do
    before { sign_in user }

    let(:review) do
      create :review, rating: 5, user: user, product: order.products.first
    end

    let(:ids) { { product_id: order.products.first.id, id: review.id } }
    let(:params) { { review: { rating: 1 } } }

    subject { patch api_v1_product_review_path(ids), params: params }

    it 'update review' do
      expect { subject }.to change { review.reload.rating }.to(1)
      expect(response).to have_http_status(200)
    end

    context 'with bad params' do
      let(:params) do
        { review: { rating: 0 } }
      end

      it 'does not update product' do
        expect { subject }.not_to(change { review.reload.rating })
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE api/v1/products/:product_id/reviews/:id' do
    before { sign_in user }

    let!(:review) { create :review, user: user, product: order.products.first }
    let(:params) { { product_id: order.products.first.id, id: review.id } }

    subject { delete api_v1_product_review_path(params) }

    it 'delete review' do
      expect { subject }.to change { Review.count }.by(-1)
      expect(response).to have_http_status(200)
    end
  end
end
