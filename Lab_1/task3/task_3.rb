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

def find_first_positive_element(array)
  for i in 0..array.length
    if array[i]>0
      return i
    end
  end
  -1
end



file_path = ARGV[0]
file = File.open(file_path)
array = file.readline.split(' ').map(&:to_i)
puts "Массив: #{array}"
puts "Поиск минимального элемента: #{find_min(array)}"
puts "Поиск индекса первого положительного элемента: #{find_first_positive_element(array)}"
