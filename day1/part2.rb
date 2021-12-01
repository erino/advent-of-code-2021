input = File.read('input')
#input = File.read('example')

larger = 0
previous = Float::INFINITY
depths = input.split("\n").map(&:to_i)

0.upto(depths.length - 3).each do |i|
  a_depth = depths[i ... (i+3)].sum
  
  if a_depth > previous
    larger = larger + 1
  end

  previous = a_depth
end
puts larger