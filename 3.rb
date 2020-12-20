MAP = File.readlines("3.txt").map(&:strip).freeze
SLOPES = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]].freeze

def traverse(right, down)
  x, y, trees = 0, 0, 0

  while y < MAP.length - 1
    x += right
    x %= MAP[y].length
    y += down

    trees += 1 if MAP[y][x] == "#"
  end

  return trees
end

puts traverse(3, 1)
puts SLOPES.map { |(dx, dy)| traverse(dx, dy) }.inject(:*)
