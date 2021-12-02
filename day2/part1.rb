file_name = 'input'

depth = 0
horizontal = 0

File.read(file_name).each_line do |step|
  command, value = step.split(' ')
  value = value.to_i
  case command
  when 'forward'
    horizontal = horizontal + value
  when 'down'
    depth = depth + value
  when 'up'
    depth = depth - value
  end

end

puts "h: #{horizontal} d: #{depth} a:#{horizontal * depth}"