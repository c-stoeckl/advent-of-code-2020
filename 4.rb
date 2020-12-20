PASSPORTS = File.read("4.txt").split("\n\n")
  .map { |s|
  s.split(/\s/)
    .map { |s| s.split(":") }
    .to_h
    .transform_keys(&:to_sym)
}.freeze

REQUIRED = [:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid].freeze

def validate_height(height)
  unit = height.chars.last(2).join
  num = height[0..-3].to_i

  ((num >= 150 && num <= 193) if unit == "cm") ||
  ((num >= 59 && num <= 76) if unit == "in")
end

def solve_1(passport)
  return REQUIRED.all? { |k| passport.key?(k) }
end

def solve_2(passport)
  byr, iyr, eyr, hgt, hcl, ecl, pid = passport.values_at(*REQUIRED)

  return solve_1(passport) &&
           [byr, iyr, eyr].all? { |v| v.length == 4 } &&
           byr.to_i.between?(1920, 2002) &&
           iyr.to_i.between?(2010, 2020) &&
           eyr.to_i.between?(2020, 2030) &&
           validate_height(hgt) &&
           hcl.match?(/(^#)([0-9]|[a-f]){6}$/) &&
           ecl.match?(/(amb|blu|brn|gry|grn|hzl|oth)/) &&
           pid.length == 9
end

puts PASSPORTS.count { |p| solve_1(p) }
puts PASSPORTS.count { |p| solve_2(p) }
