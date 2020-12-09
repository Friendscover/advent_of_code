# xmas encoding > 25 numbers preamble
# after that each number should be sum of previous 25
input = File.readlines('input.txt').map { |i| i.chomp.to_i }

stack = input.shift(25)
input_second_part = []

# part 1
def check_value(stack, current_value)
  stack.each do |stack_value|
    included_value = current_value - stack_value

    return true if stack.include?(included_value)
  end
  # returns false if value is not found in stack
  false
end

# part 2
def check_set_of_value(current_value, input_second_part)
  input_second_part.each_with_index do |_value, index|
    set_value = current_value
    i = index
    answer_array = []

    until set_value <= 0
      set_value -= input_second_part[i]
      i -= 1

      answer_array << input_second_part[i]

      if set_value.zero?
        p answer_array.max + answer_array.min
        break
      end
    end
  end
end

# main loop
until input.empty?
  current_value = input.shift

  if check_value(stack, current_value)
    stack << current_value
    input_second_part << current_value

    stack.shift
  else
    p current_value
    check_set_of_value(current_value, input_second_part)
    return
  end
end
