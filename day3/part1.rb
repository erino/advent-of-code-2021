input = File.read('input')
#input = File.read('example')

lines = input.split("\n")
readings = lines.first.length
ones = Array.new(readings, 0)

lines.each do |line|
  line.chars.each_with_index do |reading, i|
    if reading == "1"
      ones[i] = ones[i] + 1
    end
  end
end

half = lines.length / 2

gamma = ones.collect do |sum|
  sum > half ? 1 : 0
end.join.to_i(2)

eplison = (2 ** readings) - 1 - gamma

puts "expected g:394 e:3701 ge:1458194"
puts "actual   g:#{gamma} e:#{eplison} ge:#{gamma * eplison}"