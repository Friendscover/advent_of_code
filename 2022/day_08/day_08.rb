# keep a treehouse hidden
# -> number of trees that visible from outside the grid/row or column
# height of tree -> input numbers
# tree is visible if all trees betweenn itself and the border are shorter
# and outside trees
# 99

def main
    input = File.readlines('input.txt').map(&:chomp)

    number_array = []
    @tree_counter = 0
    debug_counter = 0

    input.each do |item|
        number_array << item.split(//).map{ |i| i.to_i }
    end

    number_array.each_with_index do |row, row_index|
        row.each_with_index do |item, item_index|
            position = Array.new
            position << row_index
            position << item_index

            if check_horizontal_positive(position[0], position[1], item, number_array)
                @tree_counter +=1
            elsif check_horizontal_negative(position[0], position[1], item, number_array)
                @tree_counter +=1
            elsif check_vertical_positive(position[0], position[1], item, number_array)
                @tree_counter +=1
            elsif check_vertical_negative(position[0], position[1], item, number_array)
                @tree_counter +=1
            else

            end 

            p @tree_counter
            p debug_counter += 1
        end
    end
end

# position[0] = row 
# position[1] = column

def check_horizontal_positive(row, column, value, array)
    # top/bot row
    if row == 0 || row == 98
        return true
    else
        # set the counter to the initial value of the position
        column_counter = column

        # check positive horizontal
        column_counter += 1

        until column_counter > 98
            counting_value = array[row][column_counter] 

            if counting_value >= value
                return false
            else
                column_counter += 1
            end
        end

        return true
    end
end

def check_horizontal_negative(row, column, value, array)
    column_counter = column 

    column_counter -= 1

    until column_counter < 0
        counting_value = array[row][column_counter] 

        if counting_value >= value
            return false
        else
            column_counter -= 1
        end
    end

    return true
end

def check_vertical_positive(row, column, value, array)
    # left/right column
    if column == 0 || column == 98
        return true
    else
        # set the counter to the initial value of the position
        row_counter = row

        row_counter += 1

        until row_counter > 98
            counting_value = array[row_counter][column] 

            if counting_value >= value
                return false
            else
                row_counter += 1
            end
        end

        return true
    end
end

def check_vertical_negative(row, column, value, array)
    row_counter = row 

    row_counter -= 1

    until row_counter < 0
        counting_value = array[row_counter][column] 

        if counting_value >= value
            return false
        else
            row_counter -= 1
        end
    end

    return true
end

main