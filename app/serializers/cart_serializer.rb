# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# app/serializers/cart_serializer.rb

class CartSerializer
  include JSONAPI::Serializer
  belongs_to :user, serializer: UserSerializer
end
