def is_overlap?(section1)
  to_range = ->(section) do
    section = section.gsub('-', '..')
    Range.new(*section.split("..").map(&:to_i)).to_a
  end

  process_schedule = ->(schedule) do
    sections = schedule.split(',')

    section_ids = []

    sections1 = to_range.(sections[0])
    sections2 = to_range.(sections[1])

    [sections1, sections2]
  end

  sections1, sections2 = process_schedule.call(section1)
  
  # take the intersection
  # remove the intersection from both
  # if one is empty, we have complete overlap
  common_sections = sections1 & sections2
  sections1 = sections1 - common_sections
  sections2 = sections2 - common_sections

  sections1.empty? || sections2.empty?
end

count = 0

until ARGF.eof?
  line1 = ARGF.readline.strip

  count = count + 1 if is_overlap?(line1)
end

puts count