input = File.readlines('input.txt').map { |i| i.chomp.to_i }

# part 1
one_jolts = []
three_jolts = []

p input.sort!
i = 0

input.each do |jolt|
  difference = jolt - i

  one_jolts << difference if difference == 1
  three_jolts << difference if difference == 3

  i = jolt
end

p one_jolts.length * (three_jolts.length + 1)
