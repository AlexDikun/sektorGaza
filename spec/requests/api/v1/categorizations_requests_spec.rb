# spec/requests/api/categorizations_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Categorizations', type: :request do
  let(:category) { create :category }
  let(:product) { create :product }

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
