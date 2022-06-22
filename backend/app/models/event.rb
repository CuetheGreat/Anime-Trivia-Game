class Event
  # Includes for mongo functions
  include Mongoid::Document
  include Mongoid::Timestamps

  # Declaration of class variables
  field :action, type: String
  field :penalty, type: Integer
  field :target, type: String

  # Relationships
  belongs_to :category

  # Validations
  validates :action, :penalty, :target, presence: true
  validates :action, uniqueness: true

  # Public functions
  def self.random
    random_offset = rand(count)
    rand_event = offset(random_offset).first
  end
end
