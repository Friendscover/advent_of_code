def main
  input = File.readlines('input.txt').map { |i| i.chomp.split(' ') }

  first_score = 0
  second_score = 0

  # part 1
  input.each do |element|
    first_score += result(element[0], element[1])
    first_score += decision_score(element[1])
  end

  # part 2
  input.each do |element|
    second_score += ending_move(element[0], element[1])
  end

  p first_score
  p second_score
end

def result(enemy_move, player_move)
  case enemy_move
  when 'A'
    if player_move == 'X'
      3
    elsif player_move == 'Y'
      6
    else
      0
    end
  when 'B'
    if player_move == 'X'
      0
    elsif player_move == 'Y'
      3
    else
      6
    end
  else
    if player_move == 'X'
      6
    elsif player_move == 'Y'
      0
    else
      3
    end
  end
end

def ending_move(enemy_move, player_move)
  case player_move
    when 'X'
      if enemy_move == 'A'
        # scissor 3 + loose 0
        3
      elsif enemy_move == 'B'
        # rock 1 + loose 0
        1
      else
        # paper + loose 0
        2
      end
    when 'Y'
      if enemy_move == 'A'
        # rock 1 + draw 3
        4
      elsif enemy_move == 'B'
        # paper 2 + draw 3
        5
      else
        # scissor 3 + draw 3
        6
      end
    else
      if enemy_move == 'A'
        # paper 2 + win 6
        8
      elsif enemy_move == 'B'
        # scissor 3 + win 6
        9
      else
        # rock 1 + win 6
        7
      end
  end
end

def decision_score(decision)
  case decision
  when 'X'
    1
  when 'Y'
    2
  else
    3
  end
end

main
