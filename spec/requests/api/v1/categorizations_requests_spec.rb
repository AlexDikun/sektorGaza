# spec/requests/api/v1/categorizations_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Categorizations', type: :request do
  let(:category) { create :category }
  let(:product) { create :product }

  describe 'POST api/v1/categorizations' do
    let(:params) { { category_id: category.id, product_id: product.id } }
    subject { post api_v1_categorizations_path, params: params }

    it 'create categorization' do
      expect { subject }.to change { Categorization.count }.by(1)
      expect(response).to have_http_status(201)
    end

    context 'does not create a new categorization if it already exists' do
      let!(:categorization) do
        create :categorization, category: category, product: product
      end

      it 'does not create categorization' do
        expect { subject }.not_to(change { Categorization.count })
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE api/v1/categorizations/:id' do
    let!(:categorization) do
      create :categorization, category: category, product: product
    end
    let(:params) { { id: categorization.id } }
    subject { delete api_v1_categorization_path(params) }

    it 'delete categorization' do
      expect { subject }.to change { Categorization.count }.by(-1)
      expect(response).to have_http_status(200)
    end
  end
end
