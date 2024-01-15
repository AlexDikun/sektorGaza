# app/controllers/api/v1/catalog_controller.rb
# frozen_string_literal: true

class Api::V1::CatalogController < Api::V1::BaseController
  # GET api/v1/catalog
  def index
    @grouped_list = Category.joins(:products).group('categories.id')
    render json: CategorySerializer.new(@grouped_list, include: [:products])
                                   .serializable_hash.to_json, status: :ok, code: '200'
  end

  # GET api/v1/catalog_filter
  def filter
    @category_ids = Category.find(params[:category_ids])
    @filtered_data = Product.joins(:categories).where(categories: { id: @category_ids })
    render json: ProductSerializer.new(@filtered_data, include: [:categories])
                                  .serializable_hash.to_json, status: :ok, code: '200'
  end
end
