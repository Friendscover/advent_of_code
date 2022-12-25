def main
  @input = File.read('input.txt').split(//)

  # part 1
  p message_marker(3, 4)
  # part 2
  p message_marker(13, 14)
end

def message_marker(start_counter, message_length)
  counter = start_counter
  current_combination = []

  @input.each_cons(message_length) do |c|
    counter += 1
    if c.uniq!.nil?
      current_combination = c
      break
    end
  end

  p current_combination
  counter
end

main
