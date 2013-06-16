require_relative "alien_number_v2"

i = 0
File.open(File.dirname(__FILE__) + "/A-large-practice.in", "r").each_line do |line|
  unless i == 0
    line = line.split(" ")
    File.open('results.out', 'a') do |f|
      anv2 = AlienNumberV2.new(line[1])
      anv3 = AlienNumberV2.new(line[2])
      f.puts "Case ##{i}: #{anv3.build_from(anv2.count_to(line[0]))}"
    end
  end
  i += 1
end
