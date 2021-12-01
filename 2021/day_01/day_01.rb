# open personal values from file on disks
list = File.readlines('input.txt').map { |i| i.chomp.to_i }

# set counter to 0 and get the first item of the array to compare the first item against
increased = 0
current_depth = list.shift

# iterate over each element in the array and compare it with the depth
list.each do |item|
  increased += 1 if item - current_depth > 0

  current_depth = item
end

p increased

# part 2
list = File.readlines('input.txt').map { |i| i.chomp.to_i }

increased = 0
previous_value = list[0] + list[1] + list[2]

# im shifting the first value of the list because the the first value will not
# compared to a previous value
list.shift

list.each_with_index do |item, index|
  # im printing the value before the nil error to output my answer
  # i should try to catch this error but im to lazy to write an error handler
  p increased

  current_value = item + list[index + 1] + list[index + 2]

  increased += 1 if sum > first_value

  previous_value = current_value
end
