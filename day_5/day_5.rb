input = File.readlines('input.txt').map(&:chomp)

# used bin to get the seats since its 2**8 in bin > dec
def binary(input)
  bin = []
  input.each do |i|
    bin << if i == 'B' || i == 'R'
             1
           else
             0
           end
  end

  bin
end

list = []
input.each do |item|
  row = item[0..6].split(//)
  column = item[7..10].split(//)
  p row = binary(row).join.to_i(2)
  p column = binary(column).join.to_i(2)
  list << [row, column]
end

# get seat id > row * 8 + column
seat_id = []
list.each do |l|
  seat_id << l[0] * 8 + l[1]
end

p seat_id.sort
