# spec/requests/api/categories_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Categories', type: :request do
  describe 'POST api/v1/categories' do
    let(:params) { { category: attributes_for(:category) } }
    subject { post api_v1_categories_path, params: params }

    it 'create category' do
      expect { subject }.to change { Category.count }.by(1)
      expect(response).to have_http_status(201)
    end

    context 'does not create a new category if name already exists' do
      let!(:other_category) {  create :category }
      let(:params) do
        { category: { name: other_category.name } }
      end

      it 'does not create category' do
        expect { subject }.not_to(change { Category.count })
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PATCH api/v1/categories/:id' do
    let(:category) { create :category }
    let(:params) do
      { category: { description: 'some desctiptions' } }
    end

    subject { patch api_v1_category_path(id: category.id), params: params }

    it 'update category' do
      expect { subject }.to change { category.reload.description }.to('some desctiptions')
      expect(response).to have_http_status(200)
    end

    context 'with bad params' do
      let(:params) do
        { category: { name: '' } }
      end

      it 'does not update category' do
        expect { subject }.not_to(change { category.reload.name })
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE api/v1/categories/:id' do
    let!(:category) { create :category }
    let(:params) { { id: category.id } }

    subject { delete api_v1_category_path(params) }

    it 'delete category' do
      expect { subject }.to change { Category.count }.by(-1)
      expect(response).to have_http_status(200)
    end
  end
end
