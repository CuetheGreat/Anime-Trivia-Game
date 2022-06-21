class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :events
end
