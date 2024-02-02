# == Schema Information
#
# Table name: orders
#
#  id               :bigint           not null, primary key
#  name             :string
#  telephone_number :string
#  address          :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# app/serializers/order_serializer.rb

class OrderSerializer
  include JSONAPI::Serializer
  attributes :name, :telephone_number, :address, :created_at

  has_many :line_items, serializer: LineItemSerializer
  belongs_to :user, serializer: UserSerializer
end
