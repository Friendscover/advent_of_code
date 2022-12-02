def main
  # get input data
  input = File.readlines('input.txt').map { |i| i.chomp.to_i }

  # initialize variables
  list = []
  temp_array = []

  # store each elves calories in an array
  input.each do |element|
    if element.zero?
      list << temp_array
      temp_array = []
    else
      temp_array << element
    end
  end

  # part 1 -> summarizing each array -> reverse sorting -> get highest number
  p list = list.map!(&:sum).sort.reverse

  # summarizing each array -> reverse sorting -> get first 3 highest numbers
  p list.shift(3).sum
end

main
