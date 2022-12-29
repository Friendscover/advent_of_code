class Node
  attr_accessor :size, :parent

  def initialize(name, size = nil, parent = nil)
    @name = name
    @size = size
    @parent = parent
  end
end

def main
  input = File.readlines('input.txt').map(&:chomp)

  # create a File Tree
  @file_tree = []
  @file_tree << Node.new('/', 0)

  @current_node = @file_tree[0]
  @previous_node = @file_tree[0]

  input.each do |instruction|
    instruction = instruction.split(' ')

    # decide command action
    if instruction[0] == '$'
      parse_command(instruction)
    elsif instruction[0] == 'dir'
      # do nothing yet -> can this be used as node instruction?
    else
      @current_node.size += instruction[0].to_i

      # save temp current_node
      temp_current_node = @current_node

      # update the size of each parent node after calling ls in the current node
      until @current_node.parent.nil?
        @current_node = @current_node.parent
        @current_node.size += instruction[0].to_i
      end

      @current_node = temp_current_node
    end
  end

  # store results for part 1
  result = []

  @file_tree.each do |node|
    result << node.size if node.size <= 100_000
  end

  p result.sum
end

def parse_command(instruction)
  return unless instruction[1] == 'cd'

  case instruction[2]
  when '..'
    temp_current_node = @current_node

    @current_node = @current_node.parent
    @previous_node = temp_current_node
  when '/'
    @previous_node = @current_node
    @current_node = @file_tree[0]
  else
    @previous_node = @current_node
    @current_node = Node.new(instruction[2], 0, @previous_node)
    @file_tree << @current_node
  end
end

main
