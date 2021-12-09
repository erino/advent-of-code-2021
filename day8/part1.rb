input = File.readlines('day8/input')

number_of_digits = 0
input.each do |line|
  _, output = line.split('|').collect(&:split)
  output.each do |digit|
    if [2, 3, 4, 7].include?(digit.length)
      number_of_digits += 1
    end
  end
end
puts number_of_digits