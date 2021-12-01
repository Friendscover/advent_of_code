# open personal values from file on disks
input = File.open('input.txt', 'r')
input = input.readlines

# cleanup of values
list = []
input.each do |item|
  list << item.chomp.to_i
end

# search for the values that sum up to 2020
first, second, third = nil

list.each do |first_value|
  list.each do |second_value|
    next unless first_value + second_value == 2020

    p "#{first_value} plus #{second_value} is 2020!"
    first = first_value
    second = second_value
    break
  end
end

# multiply the values to get the answer
answer = first * second
p "#{answer} is the answer, if you multiply the values!"

# added a third value, but runtime is bad > O(n)
list.each do |first_value|
  list.each do |second_value|
    list.each do |third_value|
      next unless first_value + second_value + third_value == 2020

      p "#{first_value} plus #{second_value} plus #{third_value} is 2020!"
      first = first_value
      second = second_value
      third = third_value
      break
    end
  end
end

# muliply values to get the answer
answer = first * second * third
p "#{answer} is the answer, if you multiply the values!"
