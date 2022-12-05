def main
  input = File.readlines('input.txt').map(&:chomp)

  # init variables
  first_score = 0
  second_score = 0

  char_hash = Hash.new(0)
  lowercase_array = ('a'..'z').to_a
  uppercase_array = ('A'..'Z').to_a

  char_hash = initialize_char_map(lowercase_array, 1)
  char_hash = char_hash.merge(initialize_char_map(uppercase_array, 27))

  # part 1
  input.each do |item|
    duplicate = return_duplicate_key(item)

    first_score += char_hash[duplicate]

    p first_score
  end

  # part 2
  triple_array = []

  input.each do |item|
    triple_array << item

    next unless triple_array.length == 3

    a = char_hash_map(triple_array[0].split(//))
    b = char_hash_map(triple_array[1].split(//))
    c = char_hash_map(triple_array[2].split(//))

    duplicate = a.keep_if { |key, _value| (b.key?(key) && c.key?(key)) }

    duplicate = duplicate.keys.shift.to_s

    second_score += char_hash[duplicate]

    p second_score

    triple_array = []
  end
end

def initialize_char_map(array, start_value)
  # initializes the priority map for each char
  return_hash = Hash.new(0)

  array.each do |char|
    return_hash[char.to_s] += start_value
    start_value += 1
  end

  return_hash
end

def char_hash_map(item)
  # returns a a hash of the array counting each char in the array
  return_hash = Hash.new(0)

  item.each do |char|
    return_hash[char.to_s] += 1
  end

  return_hash
end

def return_duplicate_key(item)
  a = item.slice(0...(item.length / 2)).split(//)
  b = item.slice((item.length / 2)...item.length).split(//)

  first_compartment = char_hash_map(a)
  second_compartment = char_hash_map(b)

  duplicate = first_compartment.keep_if { |key, _value| second_compartment.key?(key) }

  duplicate.keys.shift.to_s
end

main
