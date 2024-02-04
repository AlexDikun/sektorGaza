# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  content    :text             default(""), not null
#  rating     :integer          not null
#  user_id    :bigint           not null
#  product_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# app/serializers/review_serializer.rb

class ReviewSerializer
  include JSONAPI::Serializer
  attributes :content, :rating, :created_at, :updated_at

  belongs_to :product, serializer: ProductSerializer
  belongs_to :user, serializer: UserSerializer
end
