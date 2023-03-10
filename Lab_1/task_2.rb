#12 variant

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
def count_digits_less_than3(number)
  count = 0
  number.digits.each { |i| count += 1 if i < 3 }
  count
end


# 3
def sum_prime_digits(number) # сумма простых цифр числа
  sum=0
  number.digits.each { |i| sum += i if prime?(i) }
  sum
end
def count_unique(number)
  count = 0
  number.downto(2).each { |i| count += 1 unless ((number % i).zero?) || i.gcd(number) != 1 || i.gcd(sum_prime_digits(number)) == 1 } # gcd - встроенный нод
  count
end


puts 'Введите число:'
number = STDIN.gets.to_i
puts "Сумма непростых делителей числа #{number}: #{sum_nonprime_divisors(number)}"

puts 'Введите число:'
number = STDIN.gets.to_i
puts "Количество цифр числа #{number} меньших 3: #{count_digits_less_than3(number)}"

puts 'Введите число:'
number = STDIN.gets.to_i
puts "Количество уникальных чисел числа #{number}: #{count_unique(number)}"
