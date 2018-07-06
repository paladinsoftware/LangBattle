require 'pp'

filename = ARGV[0]
start_date = ARGV.fetch(1, '0000-00-00')
end_date = ARGV.fetch(2, '9999-99-99')

puts "Processing #{ARGV[0]}"

result = Hash.new { |h, k| h[k] = 0 }
File.foreach(filename) do |line|
  day, video_id, views = line.split("\t")
  next if day < start_date || day > end_date
  result[video_id] += views.to_i
end

puts "TOP 5 VIDEOS:"
pp result.max_by(5) { |k, v| v }

puts "DISTINCT VIDEOS: #{result.length}"

memory = `ps -o rss -p #{Process::pid}`.chomp.split("\n").last.strip.to_i
puts "MEMORY: #{memory/1024} MB"
