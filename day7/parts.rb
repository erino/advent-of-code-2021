positions = [16,1,2,0,4,2,7,1,2,14]
positions = File.read('input').split(',').map(&:to_i)

best_depth = nil
total = Float::INFINITY
pt2_best_depth = nil
pt2_total = Float::INFINITY

positions.min.upto(positions.max).each do |depth|
  cost = 0
  pt2_cost = 0
  positions.each do |pos|
    c = depth - pos
    c *= -1 if c < 0
    cost += c
    pt2_cost += ((c + 1) * c) /2
  end

  if cost < total
    best_depth = depth
    total = cost
    pt2_total = pt2_cost
  end

  if pt2_cost < pt2_total
    pt2_best_depth = depth
    pt2_total = pt2_cost
  end

end

puts "depth: #{best_depth} cost: #{total}"
puts "pt2_depth: #{pt2_best_depth} pt2_total: #{pt2_total}"