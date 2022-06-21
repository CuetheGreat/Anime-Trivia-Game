class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  field :action, type: String
  field :penalty, type: Integer
  field :target, type: String
  belongs_to :category

  validates :action, :penalty, :target, presence: true
end
