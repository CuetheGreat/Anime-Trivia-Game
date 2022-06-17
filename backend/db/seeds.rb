%w[Trivia Truth Dare NHIE].each do |i|
  cat = Category.new(name: i)
  cat.save
  puts cat.id
end
