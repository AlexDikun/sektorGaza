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
    attributes :title, :body, :price, :image_data
  end
