def main
  input = File.read('input.txt').split("\n")

  valid_games_sum = 0
  fewest_cubes_sum = 0

  input.each do |item|
    # split
    game = item.split(':')[0]
    game_id = game.split(' ')[1].to_i

    # split to get game data
    game_data = item.split(':')[1]

    game_data = game_data.split(';')

    # check data if game is valid
    valid_games_sum += game_id if valid_game?(game_data)

    # part 2
    fewest_cubes_sum += calculate_fewest_cubes(game_data)
    p fewest_cubes_sum
  end

  p valid_games_sum
end

def valid_game?(game_data)
  # max_values
  max_red = 12
  max_green = 13
  max_blue = 14

  round = game_data.map { |g| g.split(',') }

  round.each do |draw|
    draw.each do |cubes|
      cubes = cubes.split(' ')

      # check if values are greater than max
      if cubes[1] == 'red'
        return false if cubes[0].to_i > max_red
      elsif cubes[1] == 'green'
        return false if cubes[0].to_i > max_green
      elsif cubes[0].to_i > max_blue
        return false
      end
    end
  end

  true
end

def calculate_fewest_cubes(game_data)
  fewest_red = 0
  fewest_green = 0
  fewest_blue = 0

  round = game_data.map { |g| g.split(',') }

  round.each do |draw|
    draw.each do |cubes|
      cubes = cubes.split(' ')

      # check if values are greater than fewest
      if cubes[1] == 'red'
        fewest_red = cubes[0].to_i if cubes[0].to_i > fewest_red
      elsif cubes[1] == 'green'
        fewest_green = cubes[0].to_i if cubes[0].to_i > fewest_green
      elsif cubes[0].to_i > fewest_blue
        fewest_blue = cubes[0].to_i
      end
    end
  end

  (fewest_red * fewest_green * fewest_blue)
end

main
