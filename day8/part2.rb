input = File.read('day8/input').split("\n")

number_of_digits = 0
result = input.sum do |line|
  #puts "----"
  #line = "be abcdefg bcdefg acdefg bceg cdefg abdefg bcdef abcdf bde | abcdefg bcdef bcdefg bceg"

  patterns, outputs = line.split('|').collect do |c|
    c.split.collect do |d|
      d.chars.sort.join
    end
  end

  digits = []
  multiple = []
  segments = {}

  patterns.each do |digit|

    if multiple[digit.length].nil?
      multiple[digit.length] = []
    end
    multiple[digit.length] << digit.chars

    digit.chars.each do |s|
      if segments[s].nil?
        segments[s] = 1
      else
        segments[s] += 1
      end
    end

    case digit.length
    when 2
      digits[1] = digit
    when 3
      digits[7] = digit
    when 4
      digits[4] = digit
    when 6
    when 7
      digits[8] = digit
    end
  end

  segment_a = (digits[7].chars - digits[1].chars).first
  segment_e = segments.find { |_, v| v == 4 }.first
  segment_f = segments.find { |_, v| v == 9 }.first

  segment_c = segments.select { |k, v| k != segment_a && v == 8 }.keys.first
  segment_b = segments.find { |_, v| v == 6 }.first
  
  segment_b_or_d = (digits[4].chars - digits[1].chars)
  segment_d_or_g = segments.select { |_, v| v == 7 }.keys

  segment_d = (segment_b_or_d & segment_d_or_g).first
  segment_g = (segment_d_or_g - [segment_d]).first


  seg_0 = (segment_a + segment_b + segment_c + segment_e + segment_f + segment_g).chars.sort.join
  seg_2 = (segment_a + segment_c + segment_d + segment_e + segment_g).chars.sort.join
  seg_3 = (segment_a + segment_c + segment_d + segment_f + segment_g).chars.sort.join
  seg_5 = (segment_a + segment_b + segment_d + segment_f + segment_g).chars.sort.join
  seg_6 = (segment_a + segment_b + segment_d + segment_e + segment_f + segment_g).chars.sort.join
  seg_9 = (segment_a + segment_b + segment_c + segment_d + segment_f + segment_g).chars.sort.join

  digits[0] = patterns[patterns.index(seg_0)]
  digits[2] = patterns[patterns.index(seg_2)]
  digits[3] = patterns[patterns.index(seg_3)]
  digits[5] = patterns[patterns.index(seg_5)]
  digits[6] = patterns[patterns.index(seg_6)]
  digits[9] = patterns[patterns.index(seg_9)]

  outputs.collect do |o|
    digits.index(o)
  end.join.to_i

end

puts result


#   0: 6    1: 2    2: 5    3: 5    4: 4
#  aaaa    ....    aaaa    aaaa    ....
# b    c  .    c  .    c  .    c  b    c
# b    c  .    c  .    c  .    c  b    c
#  ....    ....    dddd    dddd    dddd
# e    f  .    f  e    .  .    f  .    f
# e    f  .    f  e    .  .    f  .    f
#  gggg    ....    gggg    gggg    ....

#   5: 5    6: 6    7: 3    8: 7    9: 6
#  aaaa    aaaa    aaaa    aaaa    aaaa
# b    .  b    .  .    c  b    c  b    c
# b    .  b    .  .    c  b    c  b    c
#  dddd    dddd    ....    dddd    dddd
# .    f  e    f  .    f  e    f  .    f
# .    f  e    f  .    f  e    f  .    f
#  gggg    gggg    ....    gggg    gggg

# - a: 8
# - b: 6
# - c: 8
# d: 7
# - e: 4
# - f: 9
# g: 7
#be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe