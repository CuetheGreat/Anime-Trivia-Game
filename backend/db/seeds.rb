%w[Trivia Truth Dare NHIE].each do |i|
  cat = Category.new(name: i)
  cat.save
  e = Event.new(action: 'Test Action', penalty: 0, target: 'Self', category: cat)
  e.save
end