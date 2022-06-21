class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :slug, type: String
  has_many :events
  before_create :set_slug
  before_save :set_slug

  validates :name, presence: true, uniqueness: true

  def set_slug
    self.slug = name.parameterize
  end
end
