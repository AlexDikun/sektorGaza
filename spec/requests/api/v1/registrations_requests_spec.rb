# spec/requests/api/v1/registrations_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

describe 'Api::V1::Registrations', type: :request do
  context 'When creating a new user' do
    let(:user) { build :user }
    let(:expected_response) { { 'email' => user.email } }
    let(:params) do
      { user: { email: user.email,
                password: user.password,
                fullname: user.fullname } }
    end

    subject { post '/api/v1/signup', params: params }

    it 'user registration' do
      expect { subject }.to change { User.count }.by(1)
      expect(response).to have_http_status(200)
      expect(response.headers['Authorization']).to be_present
      json_response = JSON.parse(response.body)
      expect(json_response['data']['attributes']).to include(expected_response)
    end
  end

  context 'When an email already exists' do
    let!(:existing_user) { create :user }
    let(:params) do
      { user: { email: existing_user.email,
                password: existing_user.password } }
    end

    subject { post '/api/v1/signup', params: params }

    it 'user was unable to register' do
      expect { subject }.not_to(change { User.count })
      expect(response).to have_http_status(400)
    end
  end
end
