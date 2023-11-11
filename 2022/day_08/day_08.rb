# keep a treehouse hidden
# -> number of trees that visible from outside the grid/row or column
# height of tree -> input numbers
# tree is visible if all trees betweenn itself and the border are shorter
# and outside trees
# 99

def main
    input = File.readlines('input.txt').map(&:chomp)

    number_array = []

    input.each do |item|
        number_array << item.split(//).map{ |i| i.to_i }
    end

    number_array.each_with_index do |element, element_index|
        element.each_with_index do |item, item_index|
            position = Array.new
            position << item_index
            position << element_index

            p horizontal_check(position, item)
        end
    end
end

def horizontal_check(position, value)
    p position[0]
    # if position[0] == 0 || position[0]
end

main