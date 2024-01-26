# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          default(1)
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :integer
#

# app/serializers/line_item_serializer.rb

class LineItemSerializer
  include JSONAPI::Serializer
  attributes :product_id, :cart_id, :quantity

  belongs_to :product, serializer: ProductSerializer
  belongs_to :cart, serializer: CartSerializer
end
