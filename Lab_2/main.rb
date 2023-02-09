# frozen_string_literal: true

require_relative 'student'

student1 = Student.new('Полетов', 'Разбор', 'Алексеевич')
student2 = Student.new('Пиндосов', 'Облом', 'Баракович', { id: 1, telegram: 'fakk_usa' })
student3 = Student.new('Атому', 'Ли', 'Ядала', { phone: '79181461800', email: 'goaloffway@mail.ru', git: 'vitaliyg' })
student4 = Student.new('Гераклов', 'Поход', 'Подвигоевич', {id: 12, phone: '79698876534'})
student5 = Student.new('Братанов', 'Друган', 'Кентович', {id: 77, phone: '77777777777'})

puts student1
puts student2
puts student3
puts student4
puts student5
