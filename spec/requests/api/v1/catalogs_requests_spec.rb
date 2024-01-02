# spec/requests/api/catalogs_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Catalogs', type: :request do
  describe 'GET api/vi/catalogs' do
    let!(:instruments) { create :category }
    let!(:piano) { create :product }
    let!(:join_1) do
      create :categorization, category_id: instruments.id, product_id: piano.id
    end

    let!(:songs) { create :category }
    let!(:katyusha) { create :product }
    let!(:join_2) do
      create :categorization, category_id: songs.id, product_id: katyusha.id
    end

    subject { get api_v1_catalogs_path }

    it 'returns list list of products grouped by category' do
      subject

      expected_response_for_category = instruments.id.to_s
      expected_response_for_product = { 'body' => piano.body }
      expected_grouping = 'categories'
      
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(json_response).to be_an(Hash)
      expect(json_response['data'].first['relationships'])
            .to include(expected_grouping)
      expect(json_response['data']
            .first['relationships']['categories']['data']
            .first['id']).to eq(expected_response_for_category)
      expect(json_response['data'].first['attributes'])
            .to include(expected_response_for_product)
    end
  end
end
