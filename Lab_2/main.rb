# frozen_string_literal: true

require_relative 'student'
require_relative 'student_short'

student1 = Student.new('Полетов', 'Разбор', 'Алексеевич')
student2 = Student.new('Пиндосов', 'Облом', 'Баракович', { id: 1, telegram: '@fakk_usa' })
student3 = Student.new('Атому', 'Ли', 'Ядала', { phone: '79181461800', email: 'goaloffway@mail.ru', git: '@vitaliyg' })
student4 = Student.new('Гераклов', 'Поход', 'Подвигоевич', { id: 12, phone: '79698876534' })
student5 = Student.new('Братанов', 'Друган', 'Кентович', { id: 77, phone: '+7 (777)-777-77-77' })

puts student1
puts student2
puts student3
puts student4
puts student5

puts Student.valid_phone?('79181461800')
puts Student.valid_phone?('+9 (777)-777-77-77')

puts Student.valid_account?('@r1411')
puts Student.valid_email?('s0160151@edu.kubsu.ru')

puts student3.git?


puts student5

student6 = StudentShort.new(student5)
puts student6.git.inspect

puts student6.contact?
puts student1.contact?
