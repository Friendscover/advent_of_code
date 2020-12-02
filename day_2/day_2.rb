# password policy > password
# policy lowest + highest number of times a given letter must appera

# open given input
input = File.open('input.txt', 'r')
input = input.readlines

# cleanup file data and separate into arrays
list = []
input.each do |item|
  item.chomp
  list << item.split(' ')
end

# range 0 < min range 1 < max
range = []
count = 0
valid_passwords = 0
valid_positions = 0

list.each do |item|
  # strip input of unnecessary data
  range = item[0].split('-')
  item[1] = item[1][0]

  # count the times the char is in element
  item[2].split(//).each do |char|
    count += 1 if char == item[1]
  end

  # checks if the count is in range
  valid_passwords += 1 if count >= range[0].to_i && count <= range[1].to_i

  # checks if the positions equal exactly one char
  if (item[2][(range[0].to_i - 1)] == item[1] && item[2][(range[1].to_i - 1)] != item [1]) || (item[2][(range[1].to_i - 1)] == item[1] && item[2][(range[0].to_i - 1)] != item [1])
    valid_positions += 1
  end
  # reset count
  count = 0
end

p valid_passwords
p valid_positions
