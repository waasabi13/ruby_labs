puts "Hello world"

##################

input_name = ARGV[0]
puts "Категорически приветствую, #{input_name}!"

input = STDIN.gets
name = input.chomp
puts "#{name}, какой твой любимый язык?"

lang = STDIN.gets.chomp
case lang
when "ruby","Ruby"
  puts "Ты подлиза!"
when "python","Python"
  puts "Мое почтение!"
when "c++","C++"
  puts "Перваш"
when "Prolog","prolog"
  puts "Ты в своем познании настолько преисполнился"
else
  "Вау, что-то неординарное"
end

###########

puts "#{name}, введи команду Ruby: "
ruby_com = STDIN.gets.chomp
system "ruby -e \"#{ruby_com}\""

puts "#{name}, введи команду ОС: "
os_com = STDIN.gets.chomp
system "#{os_com}"