# app/controllers/api/v1/catalogs_controller.rb
# frozen_string_literal: true

class Api::V1::CatalogsController < Api::V1::BaseController
  # GET api/v1/catalogs
  def index
    @grouped_list = Product.joins(:categories).order('categories.id')
    render json: ProductSerializer.new(@grouped_list, include: [:categories]).serializable_hash.to_json,
           status: :ok, code: '200'
  end
end
