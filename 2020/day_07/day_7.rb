input = File.readlines('input.txt').map(&:chomp)

# input cleanup to work with it
bags = []
input.each do |i|
  i = i.split(' contain')
  i[1] = i[1].split(',')
  bags << i
end

container = []
bags.each do |bag|
  bag[1].each do |b|
    b = b.split(/\W+/)
    container << [bag[0], b[-3..-1].join(' ')]
  end
end

# put the shiny gold bag on the stack
stack = []
container.each do |con|
  stack << con[0] if con[1].include?('shiny gold')
end

i = 0
loop do
  current_bag = stack[i]

  current_bag = current_bag.gsub('bags', 'bag')

  container.each do |con|
    stack << con[0] if con[1].include?(current_bag)
  end

  i += 1
  break if stack[i].nil?
end

p stack.uniq!.length
