def main
  # get input data
  input = File.readlines('input.txt').map(&:chomp)

  sum = 0

  input.each do |items|
    # replace all non number chars with a  star and delete them from the array
    items.gsub!(/[a-zA-Z]/, '*')
    items = items.split(//).delete_if { |i| i == '*' }

    # concat the strings from the array and convert them to ints 
    number = items.first + items.last
    sum += number.to_i
  end

  p sum
end

main
