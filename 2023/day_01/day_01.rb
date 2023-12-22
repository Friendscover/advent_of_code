def main
  # get input data
  input = File.readlines('input.txt').map(&:chomp)

  sum = 0
  number_patterns = %w[one two three four five six seven eight nine]

  input.each do |items|
    # part2 replaces written numbers with numbers in between
    items.gsub!(number_patterns[0], 'on1e')
    items.gsub!(number_patterns[1], 'tw2o')
    items.gsub!(number_patterns[2], 'thr3ee')
    items.gsub!(number_patterns[3], 'fo4ur')
    items.gsub!(number_patterns[4], 'fi5ve')
    items.gsub!(number_patterns[5], 'si6x')
    items.gsub!(number_patterns[6], 'se7ven')
    items.gsub!(number_patterns[7], 'eigh8te')
    items.gsub!(number_patterns[8], 'ni9ne')

    # replace all non number chars with a  star and delete them from the array
    coordinates = items.gsub(/[a-zA-Z]/, '*')
    coordinates = coordinates.split(//).delete_if { |i| i == '*' }

    # concat the strings from the array and convert them to ints
    number = coordinates.first + coordinates.last
    sum += number.to_i
  end

  p sum
end

main
