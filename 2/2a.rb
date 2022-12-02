OUTCOME_SCORE = {LOSE: 0, DRAW: 3, WIN: 6}.freeze

YOU_ROCK = 'X'.freeze
YOU_PAPER = 'Y'.freeze
YOU_SCISSORS = 'Z'.freeze

OPPONENT_ROCK = 'A'.freeze
OPPONENT_PAPER = 'B'.freeze
OPPONENT_SCISSORS = 'C'.freeze

ROCK = 'A'.freeze
PAPER = 'B'.freeze
SCISSORS = 'C'.freeze

SHAPE_SCORE = { ROCK => 1, PAPER => 2, SCISSORS => 3}

def standardize_input(input)
  translation = {'X' => 'A', 'Y' => 'B', 'Z' => 'C'}

  translation[input]
end

def draw?(opponent, you)
  opponent == you
end

def win?(opponent, you)
  (you == ROCK && opponent == SCISSORS) || (you == PAPER && opponent == ROCK) ||
  (you == SCISSORS && opponent == PAPER)
end

def outcome(opponent, you)
  result = if draw?(opponent, you)
    :DRAW
  elsif win?(opponent, you)
    :WIN
  else
    :LOSE
  end

  OUTCOME_SCORE[result]
end

def round_score(opponent, you)
  you = standardize_input(you)
  SHAPE_SCORE[you] + outcome(opponent, you)
end

score = ARGF.reduce(0) do |score, line|
  line.strip!

  opponent, you = line.split

  score = score + round_score(opponent, you)

  score
end

puts score