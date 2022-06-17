require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @cat = Category.new(name: 'Trivia')
  end
  describe '#name' do
    it 'can create a new instance of category with a valid name' do
      expect(@cat.name).to eq('Trivia')
    end
  end
end
