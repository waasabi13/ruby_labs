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

def most_frequency(array)
  count=array.count(array[0])
  result=array[0]
  array.each do |element|
    if array.count(element)>count
      result=element
      count=array.count(element)
    end
  end
  result
end
def built_special_array(array)
  result=[]
  target_elem=most_frequency(array)
  (0..array.length-1).each do |idx|
    result<<idx if array[idx]==target_elem
  end
  result
end

def built_array_self_div_unique(array)
  result=[]
  (1..array.length-1).each do |idx|
    result<<array[idx] if array[idx]%idx==0 && array.count(array[idx])==1
  end
  result
end

file_path = ARGV[0]
file = File.open(file_path)
array = file.readline.split(' ').map(&:to_i)
puts "Массив: #{array}"
puts "Результат: #{reverse_between_min_max(array)}"
puts "Результат: #{find_two_very_max_elements(array)}"
puts "Результат: #{find_max_odd(array)}"
puts "Результат: #{built_special_array(array)}"
puts "Результат: #{built_array_self_div_unique(array)}"