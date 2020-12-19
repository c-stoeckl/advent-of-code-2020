def parse_line(line)
  policy, password = line.split(":").map(&:strip)
  char = policy.split(" ").last
  a, b = policy.split(" ").first.split("-").map(&:to_i)
  return { :password => password, :char => char, :a => a, :b => b }
end

def valid_1?(line)
  occurences = line[:password].scan(line[:char]).count
  return occurences >= line[:a] && occurences <= line[:b]
end

def valid_2?(line)
  a = line[:password][line[:a] - 1] == line[:char]
  b = line[:password][line[:b] - 1] == line[:char]
  return a != b
end

valid_old = []
valid_new = []

File.readlines("2.txt").each do |line|
  line = parse_line(line)
  valid_old << line if valid_1?(line)
  valid_new << line if valid_2?(line)
end

puts valid_old.length
puts valid_new.length
