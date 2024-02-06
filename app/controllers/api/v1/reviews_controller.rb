# app/controllers/api/v1/reviews_controller.rb
# frozen_string_literal: true

class Api::V1::ReviewsController < Api::V1::BaseController
  include Pundit::Authorization

  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_product

  # GET api/v1/products/:product_id/reviews
  def index
    @reviews = @product.reviews
    render jsonapi: @reviews, status: :ok, code: '200'
  end

  # GET api/v1/products/:product_id/reviews/:id
  def show
    @review = @product.reviews.find(params[:id])
    render jsonapi: @review, status: :ok, code: '200'
  end

  # POST api/v1/products/:product_id/reviews
  def create
    return if alredy_reviewed?

    @review = Review.new(review_params)
    @review.product = @product
    @review.user = current_user
    authorize @review
    if @review.save
      render jsonapi: @review, status: :created, code: '201'
    else
      render jsonapi_errors: @review.errors,
             status: :unprocessable_entity, code: '422'
    end
  end

  # PATCH/PUT api/v1/products/:product_id/reviews/:id
  def update
    @review = current_user.reviews.find(params[:id])
    authorize @review
    if @review.update(review_params)
      render jsonapi: @review, status: :ok, code: '200'
    else
      render jsonapi_errors: @review.errors,
             status: :unprocessable_entity, code: '422'
    end
  end

  # DELETE api/v1/products/:product_id/reviews/:id
  def destroy
    @review = current_user.reviews.find(params[:id])
    authorize @review
    if @review.destroy
      render jsonapi: @review, status: :ok, code: '200'
    else
      render jsonapi_errors: @review.errors,
             status: :unprocessable_entity, code: '422'
    end
  end

  private

  def alredy_reviewed?
    @product.reviews.where(user: current_user).exists?
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
