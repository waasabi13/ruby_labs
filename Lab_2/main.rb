# frozen_string_literal: true

require_relative 'student'
require_relative 'student_short'

# student1 = Student.new('Полетов', 'Разбор', 'Алексеевич')
# student2 = Student.new('Пиндосов', 'Облом', 'Баракович', { id: 1, telegram: '@fakk_usa' })
# student3 = Student.new('Атому', 'Ли', 'Ядала', { phone: '79181461800', email: 'goaloffway@mail.ru', git: '@vitaliyg' })
# student4 = Student.new('Гераклов', 'Поход', 'Подвигоевич', {id: 12, phone: '79698876534'})
# student5 = Student.new('Братанов', 'Друган', 'Кентович', {id: 77, phone: '+7 (777)-777-77-77'})
#
# puts student1
# puts student2
# puts student3
# puts student4
# puts student5
#
# puts Student.valid_phone?('79181461800')
# puts Student.valid_phone?('+9 (777)-777-77-77')
#
# puts Student.valid_account?('@r1411')
# puts Student.valid_email?('s0160151@edu.kubsu.ru')
#
# puts student3.git?
#
# student1.set_contacts({telegram: '@waasabi13'})
# puts student1
#
# puts student5.short_info

# st=StudentShort.new(1, '{"last_name": "Еремин", "first_name": "Роман", "paternal_name": "Владиславович", "git": "@r1411", "email": "r1411@gmail.com"}')
# puts st.last_name_and_initials

student = Student.new('Пиндосов', 'Облом', 'Баракович', { id: 1, telegram: '@fakk_usa' })

puts student.to_s
#puts student.paternal_name

# st2 = StudentShort.from_student(student)
# puts st2.last_name_and_initials
