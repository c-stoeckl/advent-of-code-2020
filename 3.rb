map = File.readlines("3.txt").map(&:strip)

def traverse(map, right, down)
  x, y, trees = 0, 0, 0

  while y < map.length - 1
    x += right
    x %= map[y].length
    y += down

    trees += 1 if map[y][x] == "#"
  end

  return trees
end

def solve2(map)
  results = []
  slopes = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]

  for slope in slopes
    results << traverse(map, slope[0], slope[1])
  end

  return results.inject(:*)
end

puts traverse(map, 3, 1)
puts solve2(map)
