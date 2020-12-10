# part 1
input = File.readlines('input.txt').map(&:chomp)

# group each groups answers
answers = []
group = []
input.each do |item|
  if item == ''
    answers << group
    group = []
  else
    group << item
  end
end

# join the groups answers, and add only one char to the array
uniques = []
answers.each do |answer|
  uniques << answer.join.split(//).uniq
end

# count length of  array and sum them up since each char is only once in array
i = 0
uniques.each do |u|
  i += u.length
end

p i

# part 2
same_answers = []
answers.each_with_index do |answer, index|
  # group size to determine how many chars have to be present in answer
  group_size = answer.length
  i = 0

  uniques[index].each do |char|
    i += 1 if answer.join.count(char) == group_size
  end
  same_answers << i
end

p same_answers.sum
