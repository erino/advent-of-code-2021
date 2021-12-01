input = File.read('input')
#input = File.read('example')

previous = Float::INFINITY
larger = 0
input.split("\n").each do |line|
  depth = line.to_i
  if depth > previous
    larger = larger + 1
  end
  previous = depth
end

puts larger