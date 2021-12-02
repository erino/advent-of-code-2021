file_name = 'input'

depth = 0
horizontal = 0
aim = 0

File.read(file_name).each_line do |step|
  command, value = step.split(' ')
  value = value.to_i
  case command
  when 'forward'
    horizontal = horizontal + value
    depth = depth + (aim * value)
  when 'down'
    aim = aim + value
  when 'up'
    aim = aim - value
  end

  puts "c:#{command.ljust(8)} v:#{value} - f:#{horizontal} d:#{depth} a:#{aim}"
end

puts "h: #{horizontal} d: #{depth} a:#{horizontal * depth}"