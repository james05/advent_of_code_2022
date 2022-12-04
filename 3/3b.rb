input = "vJrwpWtwJgWrhcsFMMfFFhFp"

def split_compartments(rucksack)
  midpoint = rucksack.length / 2

  compartment_one = rucksack[0..midpoint-1]
  compartment_two = rucksack[midpoint..-1]

  [compartment_one, compartment_two]
end

def find_badge_type(line1, line2, line3)
  line1 = line1.split(//)
  line2 = line2.split(//)
  line3 = line3.split(//)

  (line1 & line2 & line3).first
end

def priority(item)
  if ('a'..'z').include?(item)
    item.ord - 'a'.ord + 1
  else
    item.ord - 'A'.ord + 27
  end
end

def priority_for_rucksack(line1, line2, line3)
  badge_type = find_badge_type(line1, line2, line3)

  priority(badge_type)
end

sum = 0

until ARGF.eof?
  line1 = ARGF.readline
  line2 = ARGF.readline
  line3 = ARGF.readline

  sum += priority_for_rucksack(line1, line2, line3)
end

puts sum