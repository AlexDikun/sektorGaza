# == Schema Information
#
# Table name: categorizations
#
#  id          :bigint           not null, primary key
#  category_id :integer
#  product_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class CategorizationSerializer
  include JSONAPI::Serializer
  belongs_to :category 
  belongs_to :product
end
