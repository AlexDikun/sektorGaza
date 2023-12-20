class CategorizationSerializer
  include JSONAPI::Serializer
  belongs_to :category
  belongs_to :product
end
