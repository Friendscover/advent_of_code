# seat layout
# floor > . , empty seat > L , occupied seat > #
# up/down/diagonal/left/right from one seeat > 8 positions
# all rules are applied simultaneosly
# if empty?(L) > no occupied seats adjacend > seat becomes occupied
# if occupied(#) > four or more seats adjacend occupied > empty
# else state does not change
# floo rnever changes seats dont move > noone on the floor

def main
  # get file input + sanitize data
  input = File.readlines('input.txt').map { |i| i.chomp.split(//) }


  input.each_with_index do |item, first_index|
    item.each_with_index do |element, second_index|
      
      collect_elements(first_index, second_index, input)
    end
  end
end

def collect_elements(first_index, second_index, input)
  # i is the position of the piece and j is the limit of nearby seats
  # elements collects all positons until +8 on current location
  i = 0 
  j = first_index
  k = second_index
  elements = []
  
  until j > 91 || j < 0 || i > 7 do
    elements << input[j + i][k]
    elements << input[j - i][k]
    i += 1
  end

  p elements
end


main