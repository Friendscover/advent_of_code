# if end of line is reached > wrap around
def sliding_down(right, down)
  input = File.readlines('input.txt').map(&:chomp)
  trees = 0
  i = 0

  input.each_with_index do |item, index|
    next if down > 1 && index % down != 0

    i -= item.length if i > item.length - 1

    trees += 1 if item[i] == '#'

    i += right
  end

  trees
end

p sliding_down(1, 1)
p sliding_down(3, 1)
p sliding_down(5, 1)
p sliding_down(7, 1)
p sliding_down(1, 2)
