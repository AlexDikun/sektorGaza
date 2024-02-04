# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  title      :string
#  body       :text
#  price      :decimal(, )
#  image_data :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# app/serializers/product_serializer.rb

class ProductSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :body, :price, :image, :created_at, :updated_at

  has_many :categories, serializer: CategorySerializer
  has_many :categorizations, serializer: CategorizationSerializer
  has_many :line_items, serializer: LineItemSerializer
  has_many :reviews, serializer: ReviewSerializer
end
