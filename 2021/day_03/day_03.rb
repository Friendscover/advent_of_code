# open personal values from file on disks
list = File.readlines('input.txt').map { |i| i.chomp.split(//).map(&:to_i) }

# ! filter after each selection of values
def get_rating(list, return_list)
  most_common = []
  least_common = []

  list.transpose.each do |item|
    zeroes = item.count(0)
    ones = item.count(1)

    if zeroes > ones
      most_common << 0
      least_common << 1
    else
      most_common << 1
      least_common << 0
    end
  end

  if return_list == 'common'
    most_common
  else
    least_common
  end
end

gamma_rate = get_rating(list, 'common')
epsilon_rate = get_rating(list, 'uncommon')

puts "Power consumption: #{gamma_rate.join.to_i(2) * epsilon_rate.join.to_i(2)}"

# part 2
# reading both files from drive. i think if carbon = oxy then the reference is
# on the same memory stack (ref by ref?)
oxygen_scrubber = File.readlines('input.txt').map { |i| i.chomp.split(//).map(&:to_i) }
carbon_scrubber = File.readlines('input.txt').map { |i| i.chomp.split(//).map(&:to_i) }

gamma_rate.each_with_index do |_item, index|
  rating = get_rating(oxygen_scrubber, 'common')
  oxygen_scrubber.keep_if { |value| value[index] == rating[index] }
  break if oxygen_scrubber.length == 1
end

epsilon_rate.each_with_index do |_item, index|
  rating = get_rating(carbon_scrubber, 'uncommon')
  carbon_scrubber.keep_if { |value| value[index] == rating[index] }
  break if carbon_scrubber.length == 1
end

puts "Life support rating: #{carbon_scrubber.join.to_i(2) * oxygen_scrubber.join.to_i(2)}"
