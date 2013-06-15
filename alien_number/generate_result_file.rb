require_relative "alien_number"

i = 0
File.open(File.dirname(__FILE__) + "/A-small-practice.in", "r").each_line do |line|
  unless i == 0
    line = line.split(" ")
    File.open('alien_number/results.out', 'a') do |f|
      source = AlienNumber.new(line[1])
      count = source.count_to(line[0], :increment)
      target = AlienNumber.new(line[2])
      f.puts "Case ##{i}: #{target.count_to(count)}"
    end
  end
  i += 1
end
