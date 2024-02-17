# app/controllers/api/v1/catalog_controller.rb
# frozen_string_literal: true

class Api::V1::CatalogController < Api::V1::BaseController
  include JSONAPI::Filtering

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

  # GET api/v1/catalog_sort?sort=-reviews_rating_avg
  # GET api/v1/catalog_sort?sort=reviews_rating_avg
  def sorting_products_by_reviews
    allowed = [:reviews_rating]
    options = { sort_with_expressions: true }

    jsonapi_filter(Product.includes(:reviews), allowed, options) do |filtered|
      render jsonapi: filtered.result.group('products.id')
    end
  end
end
