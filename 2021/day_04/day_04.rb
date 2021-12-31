# bingo subsystem
# random generation
def main
  input = File.readlines('input.txt').map { |i| i.chomp.split }

  # get the first line as draws for the bingo board
  draws = input.shift
  draws = draws[0].split(',').map(&:to_i)

  # winner list
  winner_list = []

  # input sanitation
  bingo = parse_bingo_board(input)

  draws.each do |draw|
    bingo.each_with_index do |board, board_index|
      board.each do |line|
        line.each_with_index do |number, line_index|
          line[line_index] = -1 if number == draw
        end

        next unless check_bingo(board)

        next if winner_list.include?(board_index)

        winner_list << board_index

        case winner_list.size
        when 99
          puts "Last bingo draw: #{draw}"
          puts "Board sum: #{board.flatten.delete_if { |n| n == -1 }.sum}"
          return
        when 1
          puts "First bingo draw: #{draw}"
          puts "Board sum: #{board.flatten.delete_if { |n| n == -1 }.sum}"
        end
      end
    end
  end
end

def parse_bingo_board(input)
  bingo = []
  temp = []

  input.each do |line|
    if line.empty?
      bingo << temp
      temp = []
    else
      temp << line.map(&:to_i)
    end
  end
  bingo
end

def check_bingo(board)
  # check row
  board.each do |line|
    return true if line.count(-1) == 5
  end

  # check column
  board.transpose.each do |line|
    return true if line.count(-1) == 5
  end

  false
end

main
