#1

def prime?(number)
  return false if number <= 1
  return true if number == 2
  Math.sqrt(number).ceil.downto(2).each { |i| return false if (number % i).zero? }
  true
end

def sum_nonprime_divisors(number)
  sum = 0
  number.downto(1).each { |i| sum += i if (number % i).zero? && !prime?(i) }
  sum
end


#2

def count_special_digits(x)
  count=0
  while x>0
    if (x%10)>3 && (x%10)%2!=0
      count+=1
    end
    x/=10
  end
  p count
end

puts 'Введите число:'
number = STDIN.gets.to_i
puts "Сумма непростых делителей числа #{number}: #{sum_nonprime_divisors(number)}"

