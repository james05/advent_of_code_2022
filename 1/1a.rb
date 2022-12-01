count = 0

max = ARGF.reduce(-1) do |max, line|
  line.strip!

  if line.empty?
    max = count > max ? count : max
    count = 0
  else
    count = count + line.to_i
  end

  max
end

puts max