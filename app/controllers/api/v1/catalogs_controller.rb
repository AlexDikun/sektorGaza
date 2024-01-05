# app/controllers/api/v1/catalogs_controller.rb
# frozen_string_literal: true

class Api::V1::CatalogsController < Api::V1::BaseController
  # GET api/v1/catalogs
  def index
    @grouped_list = Category.joins(:products).group('categories.id')
    render json: CategorySerializer.new(@grouped_list, include: [:products])
                                   .serializable_hash.to_json, status: :ok, code: '200'
  end

  # GET api/v1/filter
  def filter; end
end
