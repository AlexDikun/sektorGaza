# spec/requests/api/v1/users_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  let(:user) { create :user }
  let(:id_params) { { id: user.id } }

  describe 'GET api/v1/users/:id' do
    let(:expected_response) { { 'email' => user.email } }

    subject { get api_v1_user_path(id_params) }

    it 'return a user' do
      subject
      expect(response).to have_http_status(200)

      json_response = JSON.parse(response.body)
      expect(json_response['data']['attributes']).to include(expected_response)
    end
  end

  describe 'PATCH api/v1/users/:id' do
    let(:user_update_params) { { user: { fullname: 'Elvis Presley' } } }

    subject { patch api_v1_user_path(id_params), params: user_update_params }

    it 'update user' do
      expect { subject }.to change { user.reload.fullname }.to('Elvis Presley')
      expect(response).to have_http_status(200)
    end

    context 'does not update a user if email already exists' do
      let!(:another_user) { create :user }
      let(:bad_update_params) { { user: { email: another_user.email } } }

      subject { patch api_v1_user_path(id_params), params: bad_update_params }

      it 'does not update user' do
        expect { subject }.not_to(change { user.reload.email })
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE api/v1/users/:id' do
    let!(:user) { create :user }
    let(:params) { { id: user.id } }

    subject { delete api_v1_user_path(params) }

    it 'delete user' do
      expect { subject }.to change { User.count }.by(-1)
      expect(response).to have_http_status(200)
    end
  end
end
