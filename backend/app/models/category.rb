class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :slug, type: String

  validates :name, uniqueness: true
  before_save :set_slug

  def set_slug
    self.slug = name.parameterize
  end
end

class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :slug
end
