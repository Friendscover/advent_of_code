input = File.readlines('input.txt').map(&:chomp)

# sanitize input
operation = []
input.each { |element| operation << element.split(' ') }

i = 0
accumulator = 0
visited = Array.new(operation.size) { |_i| 0 }

loop do
  command = operation[i][0]
  argument = operation[i][1].to_i

  visited[i] += 1
  break if visited[i] == 2

  case command
  when 'acc'
    accumulator += argument
    i += 1
  when 'jmp'
    i += argument
  when 'nop'
    i += 1
  end

  p accumulator
end
