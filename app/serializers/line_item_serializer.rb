# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  product_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# app/serializers/line_item_serializer.rb

class LineItemSerializer
  include JSONAPI::Serializer
  attributes :product_id, :user_id, :quantity

  belongs_to :product, serializer: ProductSerializer
  belongs_to :user, serializer: UserSerializer
end
