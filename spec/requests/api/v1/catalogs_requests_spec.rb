# spec/requests/api/catalogs_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Catalogs', type: :request do
  describe 'GET api/vi/catalogs' do
    let(:category) { create :category }
    let(:product) { create :product }
    let!(:join) do
      create :categorization,
             category_id: category.id,
             product_id: product.id
    end

    let(:expected_json) do
      {
        data: [{
          id: category.id,
          type: :category,
          attributes: {
            name: category.name,
            description: category.description
          },
          relationships: {
            products: {
              data: [{
                id: product.id,
                type: :product
              }]
            },
            categorizations: {
              data: [{
                id: join.id,
                type: :categorization
              }]
            }
          }
        }],
        included: [{
          id: product.id,
          type: :product,
          attributes: {
            title: product.title,
            body: product.body,
            price: product.price.to_s,
            image: {
              id: product.image.id,
              storage: :store,
              metadata: {
                filename: 'product_image.webp',
                size: product.image.size,
                'mini_type' => 'image/webp'
              }
            }
          },
          relationships: {
            categories: {
              data: [{
                id: category.id,
                type: :category
              }]
            },
            categorizations: {
              data: [{
                id: join.id,
                type: :categorization
              }]
            }
          }
        }]
      }
    end

    subject { get api_v1_catalogs_path }

    it 'returns list list of products grouped by category' do
      subject

      json_response = JSON.parse(response.body)

      puts json_response

      expect(response).to have_http_status(200)
      expect(json_response).to be_an(Hash)
      expect(json_response) == expected_json
    end
  end
end
