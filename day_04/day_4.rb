input = File.readlines('input.txt').map(&:chomp)

list = []
passport = []
# cleanup file input and sanitize data
input.each do |item|
  if item.empty?
    list << passport.flatten(1)
    passport.clear
  else
    passport << item.split(' ')
  end
end

# part 1
valid = 0
list.each do |item|
  if item.length == 8
    valid += 1
  elsif item.length == 7
    valid_passport = false

    # loop through  array and if validation fails the passport will be rejected
    item.each do |i|
      key, value = i.split(':')
      case key
      when 'cid'
        valid_passport = true if key == ('cid') && item.length == 7
      end
    end
    valid += 1 if valid_passport == false
  end
end

p valid
valid = 0
# part 2
@eye_color = %w[amb blu brn gry grn hzl oth]
@fields = %w[byr iyr eyr hgt hcl ecl pid cid]

def validate(key, value)
  p key 
  p value
  case key
  when 'byr'
    return value.to_i > 1920 && value.to_i < 2002
  when 'iyr'
    return value.to_i < 2010 || value.to_i > 2020
  when 'eyr'
    return value.to_i < 2020 || value.to_i > 2030
  when 'hgt'
    num = value.split(/(?<=[0-9]) ?(?=[a-zA-Z])/)
    if num[1] == 'cm'
      return num[0].to_i < 150 || num[0].to_i > 193
    elsif num[1] == 'in'
      return num[0].to_i < 59 || num[0].to_i > 76
    else
      return false
    end
  when 'hcl'
    value = value.split("#").slice(-1)
    return value.length != 6 || !value.match(/[a-f0-9]/)
  when 'ecl'
    return false if @eye_color.include?(value)
  when 'pid'
    value.length != 9
  when 'cid'
    return false
  else
    return false
  end
end


valid += 1
list.each do |item|
  item.each do |i|
    value = i.split(":")
    p i
    if validate(value[0], value[1])
      valid += 1 
      break
    end
    p ""
  end
end

p valid

# byr (Birth Year) - four digits; at least 1920 and at most 2002.
# iyr (Issue Year) - four digits; at least 2010 and at most 2020.
# eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
# hgt (Height) - a number followed by either cm or in:
#     If cm, the number must be at least 150 and at most 193.
#     If in, the number must be at least 59 and at most 76.
# hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
# ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
# pid (Passport ID) - a nine-digit number, including leading zeroes.
# cid (Country ID) - ignored, missing or not.
