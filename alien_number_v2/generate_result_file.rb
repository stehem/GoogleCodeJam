# takes less than 15 mins on a quad core I7 using Jruby

require_relative "alien_number_v2"

i = 0
stack = []
File.open(File.dirname(__FILE__) + "/A-large-practice.in", "r").each_line do |line|
  unless i == 0
    line = line.split(" ")
    stack << line.unshift(i)
  end
  i += 1
end



threads = []

[(0..24), (25..49), (50..74), (75..99)].each do |int|

threads << Thread.new {
  stack[int].each do |line|
    File.open('results.out', 'a') do |f|
      anv2 = AlienNumberV2.new(line[2])
      anv3 = AlienNumberV2.new(line[3])
      f.puts "Case ##{line[0]}: #{anv3.build_from(anv2.number.count_to(line[1]))}"
    end
  end
}

end

threads.each {|t| t.join}

