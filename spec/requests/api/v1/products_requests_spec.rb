# spec/requests/api/v1/products_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Product', type: :request do
  describe 'POST api/v1/products' do
    let(:params) { { product: attributes_for(:product) } }
    subject { post api_v1_products_path, params: params }

    it 'create product' do
      expect { subject }.to change { Product.count }.by(1)
      expect(response).to have_http_status(201)
    end

    context 'when params invalid' do
      let(:params) do
        { product: { title: 123 } }
      end

      it 'does not create product' do
        expect { subject }.not_to(change { Product.count })
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'GET api/v1/products/:id' do
    let(:product) { create :product }
    let(:category) { create :category }
    let!(:categorization) do
      create :categorization, category: category, product: product
    end
    let(:params) { { id: product.id } }
    let(:detailed_info) do
      {
        'id' => product.id, 'title' => product.title, 'body' => product.body,
        'price' => product.price.as_json, 'image' => product.image.as_json,
        'created_at' => product.created_at.as_json,
        'updated_at' => product.updated_at.as_json
      }
    end
    let(:included) { { 'name' => category.name } }
    subject { get api_v1_product_path(params) }

    it 'show a product' do
      subject
      expect(response).to have_http_status(200)

      json_response = JSON.parse(response.body)
      expect(json_response['data']['attributes']).to include(detailed_info)
      expect(json_response['included'].first['attributes']).to include(included)
    end
  end

  describe 'PATCH api/v1/products/:id' do
    let!(:product) { create :product }
    let(:params) do
      { product: { price: 3.1415 } }
    end

    subject { patch api_v1_product_path(id: product.id), params: params }

    it 'updates product' do
      expect { subject }.to change { product.reload.price }.to(3.1415)
      expect(response).to have_http_status(200)
    end

    context 'with bad params' do
      let(:params) do
        { product: { body: '' } }
      end

      it 'does not update product' do
        expect { subject }.not_to(change { product.reload.body })
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE api/v1/products/:id' do
    let!(:product) { create :product }
    let(:params) { { id: product.id } }

    subject { delete api_v1_product_path(params) }

    it 'delete product' do
      expect { subject }.to change { Product.count }.by(-1)
      expect(response).to have_http_status(200)
    end
  end
end
