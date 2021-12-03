input = File.read('input')
#input = File.read('example')

def rating(i, a, b)
  numbers = i.split("\n")
  0.upto(numbers.first.chars.length) do |position|
    bits = {'0' => [], '1' => []}
    numbers.each do |number|
      bits[number[position]] << number
    end

    numbers = if bits['0'].length > bits['1'].length
      bits[a]
    else
      bits[b]
    end

    break if numbers.length == 1
  end
  numbers.first.to_i(2)
end

o = rating(input, '0', '1')
co2 = rating(input, '1', '0')

puts "expected o:789 co2:3586 r:2829354"
puts "actual   o:#{o} co2:#{co2} r:#{o*co2}"