class EventSerializer < ActiveModel::Serializer
  attributes :id, :action, :penalty, :target
  has_one :category
end
