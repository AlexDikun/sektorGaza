# spec/requests/api/v1/catalog_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Catalog', type: :request do
  describe 'GET api/vi/catalog' do
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

    subject { get api_v1_catalog_index_path }

    it 'returns list list of products grouped by category' do
      subject

      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(json_response).to be_an(Hash)
      expect(json_response) == expected_json
    end
  end

  describe 'GET api/v1/catalog_filter' do
    let(:desired_category) { create :category }
    let(:desired_product) { create :product }
    let!(:join1) do
      create :categorization,
             category_id: desired_category.id,
             product_id: desired_product.id
    end

    let(:another_category) { create :category }
    let(:another_product) { create :product }
    let!(:join2) do
      create :categorization,
             category_id: another_category.id,
             product_id: another_product.id
    end

    context 'returning a list of products by one category' do
      let(:params) { { category_ids: [desired_category.id] } }
      subject { get api_v1_catalog_filter_path, params: params }

      it 'filtered by one category' do
        subject
        expect(response).to have_http_status(200)

        json_response = JSON.parse(response.body)
        expect(json_response).to be_an(Hash)
        expect(json_response['data'].first['attributes'])
          .to include('title' => desired_product.title)
        expect(json_response['data'].first['attributes'])
          .not_to include('title' => another_product.title)
      end
    end

    context 'returning a list of products in several categories' do
      let(:wanted_category) { create :category }
      let(:wanted_product) { create :product }
      let!(:join3) do
        create :categorization,
               category_id: wanted_category.id,
               product_id: wanted_product.id
      end

      let(:params) { { category_ids: [desired_category.id, wanted_category.id] } }
      subject { get api_v1_catalog_filter_path, params: params }

      it 'filtered by several categories' do
        subject
        expect(response).to have_http_status(200)

        json_response = JSON.parse(response.body)

        expect(json_response).to be_an(Hash)
        expect(json_response['data'].first['attributes'])
          .to include('title' => desired_product.title)
        expect(json_response['data'].second['attributes'])
          .to include('body' => wanted_product.body)

        expect(json_response['data'].first['attributes'])
          .not_to include('title' => another_product.title)
        expect(json_response['data'].second['attributes'])
          .not_to include('body' => another_product.body)
        expect(json_response['data'].first['relationships']['categories']['data']
          .first).not_to include('id' => another_category.id)
        expect(json_response['data'].second['relationships']['categories']['data']
          .first).not_to include('id' => another_category.id)
      end
    end
  end

  describe 'GET api/v1/catalog_sort' do
    let(:piano) { create :product }           
    let(:grand_piano) { create :product }     
    let(:synth) { create :product }           

    let!(:piano_review) { create :review, product: piano, rating: 2 }
    let!(:grand_piano_review) { create :review, product: grand_piano, rating: 4 }
    let!(:synth_review) { create :review, product: synth, rating: 5 }
    let!(:synth_review2) { create :review, product: synth, rating: 1 }

    context 'a user first sees products with good reviews' do
      subject { get '/api/v1/catalog_sort?sort=-reviews_rating' }

      it 'sort in descending order' do
        subject
        expect(response).to have_http_status(200)
      end
    end

    context 'a user first sees products with bad reviews' do
      subject { get '/api/v1/catalog_sort?sort=reviews_rating' }

      it 'sort in ascending order' do
        subject
        expect(response).to have_http_status(200)
      end
    end
  end
end
