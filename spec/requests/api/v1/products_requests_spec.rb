# spec/requests/api/products_requests_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Api::V1::Products", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/products/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/products/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/products/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
