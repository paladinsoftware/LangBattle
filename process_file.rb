filename = "files/#{ARGV[0]}"
puts "Processing #{ARGV[0]}"

result = {}
File.foreach(filename) do |line|
  id, views = line.split(',')
  result[id.to_i] = result.fetch(id.to_i, 0) + views.to_i
end

# puts result
