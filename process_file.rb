require 'pp'

filename = ARGV[0]
start_date = ARGV.fetch(1, '0000-00-00')
end_date = ARGV.fetch(2, '9999-99-99')

puts "Processing #{ARGV[0]}"

result = Hash.new { |h, k| h[k] = 0 }
processed_rows = 0
skipped_rows = 0

File.foreach(filename) do |line|
  day, video_id, views = line.split("\t")
  if day < start_date || day > end_date
    skipped_rows += 1
    next
  end
  processed_rows += 1
  result[video_id] += views.to_i
end

puts "TOP 5 VIDEOS:"
pp result.max_by(5) { |k, v| v }

puts "DISTINCT VIDEOS: #{result.length}"
puts "PROCESSED ROWS: #{processed_rows}"
puts "SKIPPED ROWS: #{skipped_rows}"

memory = `ps -o rss -p #{Process::pid}`.chomp.split("\n").last.strip.to_i
puts "MEMORY: #{memory/1024} MB"
