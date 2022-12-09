# The input, the top of the ower is at the beginning of the array
TOWERS = [
  [],
  %w{R H M P Z},
  %w{B J C P},
  %w{D C L G H N S},
  %w{L R S Q D M T F},
  %w{M Z T B Q P S F},
  %w{G B Z S F T},
  %w{V R N},
  %w{M C V D T L G P},
  %w{L M F J N Q W}
]

# move 7 from 3 to 9

# TOWERS = [
#   [],
#   %w{N Z},
#   %w{D C M},
#   %w{P}
# ]

def move_from(number, from_tower, to_tower)
  items_to_move = TOWERS[from_tower].first(number).reverse

  TOWERS[from_tower] = TOWERS[from_tower].drop(number)

  TOWERS[to_tower] = items_to_move + TOWERS[to_tower]

  nil
end

def process_instructions(instructions)
  matches = instructions.match(/move (\d+) from (\d+) to (\d+)/)

  [matches[1].to_i, matches[2].to_i, matches[3].to_i]
end

i = 1

ARGF.each do |instruction|
  number, from_tower, to_tower = process_instructions(instruction)

  move_from(number, from_tower, to_tower)

end

puts TOWERS.map { |t| t[0] }.join