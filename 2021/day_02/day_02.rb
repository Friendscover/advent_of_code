# open personal values from file on disks
list = File.readlines('input.txt').map { |i| i.chomp.split(' ') }
# forward x up y down z

@depth = 0
@position = 0

list.each do |item|
  item[1] = item[1].to_i

  case item[0]
  when 'forward'
    @position += item[1]
  when 'up'
    @depth -= item[1]
  when 'down'
    @depth += item[1]
  end
end

p @depth * @position

# part 2
# same loop as before, just the logic changes when the forward case is hit
# depth is calculated by the thrird variable 'aim'

@depth = 0
@position = 0
@aim = 0

list.each do |item|
  item[1] = item[1].to_i

  case item[0]
  when 'forward'
    @position += item[1]
    @depth += @aim * item[1]
  when 'up'
    @aim -= item[1]
  when 'down'
    @aim += item[1]
  end
end

p @depth * @position
