require 'faker'
%w[Trivia Truth Dare NHIE].each do |i|
  cat = Category.new(name: i)
  cat.save
  rand(5).times do
    e = Event.new(action: Faker::Lorem.paragraph(2), penalty: Faker::Number.between(from: 1, to: 5),
                  target: %i[single pair party].sample, category: cat)
    e.save
  end
end
