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

number_method = ARGV[1].to_i
methods_array = [:find_min, :find_first_positive_element] # массив, состоящий из символов
# вдохновился с https://www.ruby-lang.org/ru/documentation/ruby-from-other-languages/

unless number_method.between?(0, methods_array.length - 1)
  puts 'Некорректный номер вызываемого метода'
  return
end
puts "Результат работы вызываемого метода: #{method(methods_array[number_method]).call(array)}"
