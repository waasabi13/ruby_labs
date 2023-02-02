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

def find_two_very_max_elements(array)
  max=array.max
  array.delete(max)
  max2=array.max
  [max,max2]
end


def find_max_odd(array)
  result=nil
  array.each{|element| result=element if (element%2!=0) and (result==nil || element>result)}
  result
end


file_path = ARGV[0]
file = File.open(file_path)
array = file.readline.split(' ').map(&:to_i)
puts "Массив: #{array}"
puts "Результат: #{reverse_between_min_max(array)}"
puts "Результат: #{find_two_very_max_elements(array)}"
puts "Результат: #{find_max_odd(array)}"