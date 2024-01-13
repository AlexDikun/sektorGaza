# spec/requests/api/v1/sessions_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

describe 'Api::V1::Sessions', type: :request do
  let!(:user) { create :user }

  describe 'POST api/v1/login' do
    let(:params) { { user: { email: user.email, password: user.password } } }

    subject { post '/api/v1/login', params: params }

    it 'user login' do
      subject
      expect(response).to have_http_status(200)
      expect(response.headers['Authorization']).to be_present
    end

    context 'When password is missing' do
      let(:params) { { user: { email: user.email, password: '' } } }

      it 'user is not login' do
        subject
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'DELETE api/v1/logout' do
    subject { delete '/api/v1/logout' }

    it 'user logout' do
      subject
      expect(response).to have_http_status(204)
    end
  end
end
