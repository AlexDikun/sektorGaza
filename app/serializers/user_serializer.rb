# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  fullname           :string
#  avatar_data        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  email              :string           default(""), not null
#  encrypted_password :string           default(""), not null
#

# app/serializers/user_serializer.rb

class UserSerializer
  include JSONAPI::Serializer
  attributes :fullname, :avatar, :email
  has_one :cart, serializer: CartSerializer
  has_many :orders, serializer: OrderSerializer
end
