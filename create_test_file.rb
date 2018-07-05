# ruby create_test_file.rb test.txt 10
# 0 - user id
# 1 - views

filename = ARGV[0]
iterations = ARGV[1].to_i

file = File.open("files/#{filename}", 'w+')
iterations.times do
  file.write "#{rand(1...5)},#{rand(100..1000)}\r\n"
end
file.close
