# ruby create_test_file.rb test.txt 10
# 0 - day
# 1 - video_id
# 2 - views

require 'date'
require 'securerandom'

filename = ARGV[0]
iterations = ARGV[1].to_i
video_ids = Array.new(100_000) { |n| SecureRandom.hex(6) }
days = Array.new(60) { |n| (Date.today - n).to_s }

File.open("tmp/#{filename}", 'w') do |file|
  iterations.times do
    file.write "#{days.sample}\t#{video_ids.sample}\t#{rand(100..1000)}\n"
  end
end
