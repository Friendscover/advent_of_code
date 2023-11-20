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
  @current_view = [1]

  input.each do |item|
    number_array << item.split(//).map(&:to_i)
  end

  number_array.each_with_index do |row, row_index|
    row.each_with_index do |item, item_index|
      if check_horizontal_positive(row_index, item_index, item, number_array)
        @tree_counter += 1
      elsif check_horizontal_negative(row_index, item_index, item, number_array)
        @tree_counter += 1
      elsif check_vertical_positive(row_index, item_index, item, number_array)
        @tree_counter += 1
      elsif check_vertical_negative(row_index, item_index, item, number_array)
        @tree_counter += 1
      end

      p @tree_counter
    end
  end

  max_scenic_view = 0
  @current_view = [1]
  scenic_view_multiplied = 0

  number_array.each_with_index do |row, row_index|
    row.each_with_index do |item, item_index|
      check_horizontal_positive(row_index, item_index, item, number_array)
      check_horizontal_negative(row_index, item_index, item, number_array)
      check_vertical_positive(row_index, item_index, item, number_array)
      check_vertical_negative(row_index, item_index, item, number_array)

      p max_scenic_view

      scenic_view_multiplied = @current_view.reject(&:zero?).inject(1, :*)

      p scenic_view_multiplied

      max_scenic_view = scenic_view_multiplied if scenic_view_multiplied > max_scenic_view

      scenic_view_multiplied = 0
      @current_view = [].drop(5)
    end
  end
end

# position[0] = row
# position[1] = column

def check_horizontal_positive(row, column, value, array)
  # top/bot row
  return true if [0, 98].include?(row)

  # check positive horizontal
  column += 1
  i = 1

  until column > 98
    counting_value = array[row][column]

    if counting_value >= value
      @current_view << i
      return false
    end

    column += 1
    i += 1
  end

  @current_view << i - 1
  true
end

def check_horizontal_negative(row, column, value, array)
  column -= 1
  i = 1

  until column < 0
    counting_value = array[row][column]

    if counting_value >= value
      @current_view << i
      return false
    end

    column -= 1
    i += 1
  end

  @current_view << i - 1
  true
end

def check_vertical_positive(row, column, value, array)
  # left/right column
  return true if [0, 98].include?(column)

  # set the counter to the initial value of the position
  row += 1
  i = 1

  until row > 98
    counting_value = array[row][column]

    if counting_value >= value
      @current_view << i
      return false
    end

    row += 1
    i += 1
  end

  @current_view << i - 1
  true
end

def check_vertical_negative(row, column, value, array)
  row -= 1
  i = 1

  until row < 0
    counting_value = array[row][column]

    if counting_value >= value
      @current_view << i
      return false
    end

    row -= 1
    i += 1
  end

  @current_view << i - 1
  true
end

main
