count = 0
elves_calories = []

ARGF.each do |line|
  line.strip!

  if line.empty?
    elves_calories << count
    count = 0
  else
    count = count + line.to_i
  end
end

puts elves_calories.sort[-3..-1].sum

# 197301
