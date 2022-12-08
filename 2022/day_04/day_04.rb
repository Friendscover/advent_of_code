def main
  input = File.readlines('input.txt').map { |i| i.chomp.split(',') }

  # initialize counter
  double_pairs = 0
  overlaps = 0

  input.each do |element|
    range_array = element.map { |i| i.split('-') }
    range_array = range_array.flatten.map(&:to_i)

    range_a = (range_array[0]..range_array[1]).to_a
    range_b = (range_array[2]..range_array[3]).to_a

    # part 2
    intersection = range_a.intersection(range_b)

    intersection.empty? ? next : overlaps += 1

    # part 1
    if range_a.length > range_b.length
      check_full_containmnent(range_a, range_b) ? double_pairs += 1 : next
    else
      check_full_containmnent(range_b, range_a) ? double_pairs += 1 : next
    end
  end

  p double_pairs
  p overlaps
end

def check_full_containmnent(long_array, short_array)
  short_array.each do |item|
    next if long_array.include?(item)

    return false
  end

  true
end

main
