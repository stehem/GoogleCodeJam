# runs in about 10 secs using 4 threads on a quad core I7 :-)

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
results = []

[(0..24), (25..49), (50..74), (75..99)].each do |int|

threads << Thread.new {
  stack[int].each do |line|
    anv2 = AlienNumberV2.new(line[2])
    anv3 = AlienNumberV2.new(line[3])
    results << [line[0], "Case ##{line[0]}: #{anv3.build_from(anv2.number.count_to(line[1]))}"]
  end
}

end

threads.each {|t| t.join}


File.open('results_large.out', 'a') do |f|
  results.sort_by { |a| a[0]}.each do |r|
    f.puts r[1]
  end
end
