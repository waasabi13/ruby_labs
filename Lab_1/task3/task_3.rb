def find_min(array)
  return nil if array.empty?
  min=array[0]
  for i in array
    if i<min
      min=i
    end
  end
  min
end



file_path = ARGV[0]
file = File.open(file_path)
array = file.readline.split(' ').map(&:to_i)
puts "Массив: #{array}"
puts "Результат работы метода: #{find_min(array)}"