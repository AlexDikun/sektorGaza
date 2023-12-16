# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null

# # app/serializers/category_serializer.rb

class CategorySerializer
  include JSONAPI::Serializer
  attributes :name, :description
end
