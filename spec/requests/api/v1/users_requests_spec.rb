# spec/requests/api/users_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  let(:user) { create :user }

  describe 'PATCH api/v1/users/:id' do
    let(:params) { { user: { fullname: 'Elvis Presley' } } }

    subject { patch api_v1_user_path(id: user.id), params: params }

    it 'the user is not authenticated' do
      expect { subject }.not_to(change { user.reload.fullname })
      expect(response).to have_http_status(422)
    end

    context 'the user has authenticated' do
      before { sign_in user }

      it 'update user' do
        expect { subject }.to change { user.reload.fullname }.to 'Elvis Presley'
        expect(response).to have_http_status(200)
      end
    end

    context 'does not update a  user if email already exists' do
      let!(:friendly) { create :user }
      let(:params) do
        { user: { email: friendly.email } }
      end

      it 'does not update user' do
        expect { subject }.not_to(change { user.reload.email })
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE api/v1/users/:id' do
    let(:params) { { id: user.id } }

    subject { delete api_v1_user_path(params) }

    it 'the user is not authenticated' do
      expect { subject }.not_to(change { User.count })
      expect(response).to have_http_status(422)
    end

    context 'the user has authenticated' do
      before { sign_in user }

      it 'delete user' do
        expect { subject }.to change { User.count }.by(-1)
        expect(response).to have_http_status(200)
      end
    end
  end
end
