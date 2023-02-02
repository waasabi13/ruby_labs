def find_min_index(array)
  array.index(array.min)
end

def find_max_index(array)
  array.index(array.max)
end

def reverse_between_min_max(array)
  max=find_max_index(array)
  min=find_min_index(array)
  min,max=max,min if min>max
  array[0..min].concat(array[min+1..max-1].reverse).concat(array[max..array.length-1])
end

file_path = ARGV[0]
file = File.open(file_path)
array = file.readline.split(' ').map(&:to_i)
puts "Массив: #{array}"
puts "Результат: #{reverse_between_min_max(array)}"