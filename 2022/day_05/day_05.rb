def main
  input = File.readlines('input.txt').map { |i| i.chomp.split('/n') }

  # remove stacks setup from input
  input.shift(10)
  crane_moves = input

  # filter crane moves for input
  crane_moves = parse_crane_moves(crane_moves)

  ## initialize stacks
  stacks = []

  stacks << %w[Q F M R L W C V]
  stacks << %w[D Q L]
  stacks << %w[P S R G W C N B]
  stacks << %w[L C D H B Q G]
  stacks << %w[V G L F Z S]
  stacks << %w[D G N P]
  stacks << %w[D Z P V F C W]
  stacks << %w[C P D M S]
  stacks << %w[Z N W T V M P C]

  p move_crates(crane_moves, stacks)
end

def parse_crane_moves(crane_moves)
  # amount, stack, destination
  return_array = []

  crane_moves.each do |element|
    element = element.to_s.split(' ')

    amount = element[1].to_i
    stack = element[3].to_i
    destination = element[5].split(//)[0].to_i

    return_array << [amount, stack, destination]
  end

  return_array
end

def move_crates(moves, stacks)
  rearranged_stacks = stacks

  moves.each do |move|
    # select stack e1
    stack = move[1]
    # amount e0
    amount = move[0]
    # destination e2
    destination = move[2]

    moving_crates = rearranged_stacks[stack - 1].pop(amount)

    # reversing the array to let the last crate be the first
    moving_crates.reverse!

    moving_crates.each do |crate|
      rearranged_stacks[destination - 1] << crate
    end
  end
  rearranged_stacks
end

main
