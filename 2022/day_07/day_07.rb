def main
  input = File.readlines('input.txt').map { |i| i.chomp }

  # define direction pointers
  @current_dir = "/"
  @previous_dir = "/"
  
  # define size_tree
  file_tree = Hash.new(0)

  # define sum var of all dirs >= 100000
  sum = 0

  input.each do |instruction|
    instruction = instruction.split(" ")
    
    # decide command action
    if instruction[0] == "$"
      parse_command(instruction)
    elsif instruction[0] == "dir"
      # do nothing yet -> can this be used as node instruction?
    else
      file_tree["#{@current_dir}"] += instruction[0].to_i
    end
  end

  # add descending dir sizes to previous dir
  file_tree.each do |first_key, first_value|
    current_size = first_value

    file_tree.each do |second_key, second_value|
      if second_key.include?(first_key)
        file_tree["#{first_key}"] += second_value
      end
    end

    # substract previous size because size has been counted two times (second loop)
    # file_tree["#{first_key}"] -= current_size
  end

  p file_tree

  file_tree.each_value do |value|
    if value <= 100000
      sum += value
    end
  end
  # 659554
  # 271960

  p sum
end

def parse_command(instruction)
  if instruction[1] == "cd"
    case instruction[2]
    when ".."
      temp_current_dir = @current_dir

      @current_dir = @previous_dir
      @previous_dir = temp_current_dir
    when "/"
      @previous_dir = @current_dir
      @current_dir = "/"
    else
      @previous_dir = @current_dir
      @current_dir = @current_dir + "-" + instruction[2]
    end
  end
end

main