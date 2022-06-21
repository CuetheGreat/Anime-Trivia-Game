class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum
  field :action, type: String
  field :penalty, type: Integer
  field :target, type: Enun,
  belongs_to :category

  validates :action, :penalty, :target, presence: true
  validates :action, uniqueness: true

  def self.random
    random_offset = rand(count)
    rand_event = offset(random_offset).first
  end
end
