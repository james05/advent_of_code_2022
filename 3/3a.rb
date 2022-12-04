input = "vJrwpWtwJgWrhcsFMMfFFhFp"

def split_compartments(rucksack)
  midpoint = rucksack.length / 2

  compartment_one = rucksack[0..midpoint-1]
  compartment_two = rucksack[midpoint..-1]

  [compartment_one, compartment_two]
end

def find_misplaced_item(rucksack)
  compartment_one, compartment_two = split_compartments(rucksack)
  compartment_one = compartment_one.split(//)
  compartment_two = compartment_two.split(//)

  (compartment_one & compartment_two).first
end

def priority(item)
  if ('a'..'z').include?(item)
    item.ord - 'a'.ord + 1
  else
    item.ord - 'A'.ord + 27
  end
end

def priority_for_rucksack(rucksack)
  misplaced_item = find_misplaced_item(rucksack)

  priority(misplaced_item)
end


total_priority = ARGF.sum(0) do |line|
  priority_for_rucksack(line)
end

puts total_priority