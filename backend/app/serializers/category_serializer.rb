class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :slug
  has_many :events, serializer: EventSerializer
end
