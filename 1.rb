input = File.readlines("1.txt").map(&:to_i)

def solve(input, n)
  input.combination(n).each { |c| return c.inject(:*) if c.sum == 2020 }
end

puts solve(input, 2)
puts solve(input, 3)
