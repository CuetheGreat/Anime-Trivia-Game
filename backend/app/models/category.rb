class Category
  # Includes for mongo functions
  include Mongoid::Document
  include Mongoid::Timestamps

  # Declarations for class variable
  field :name, type: String
  field :slug, type: String

  # Relationship
  has_many :events
  before_save :set_slug

  # Validations
  validates :name, presence: true, uniqueness: true

  # Private functions
  private

  def set_slug
    self.slug = name.parameterize
  end
end
