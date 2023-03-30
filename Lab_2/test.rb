require_relative 'student'
require_relative 'student_short'
require_relative 'data_list_student_short'
require_relative 'student_list_base'
require_relative 'student_list_txt'
require_relative 'student_list_json'
require_relative 'student_list_yaml'
require 'json'

student1 = Student.new('Полетов', 'Разбор', 'Алексеевич')
student2 = Student.new('Пиндосов', 'Облом', 'Баракович', { id: 1, telegram: '@fakk_usa' })
student3 = Student.new('Атому', 'Ли', 'Ядала', {email: 'goaloffway@mail.ru', git: '@vitaliyg' })
student4 = Student.new('Гераклов', 'Поход', 'Подвигоевич', { id: 12, phone: '79698876534' })
student5 = Student.new('Братанов', 'Друган', 'Кентович', { id: 77, phone: '+7 (777)-777-77-77' })

puts '--------------------------------'
puts 'Тест StudentsList (JSON):'

stud_list_json = StudentListBase.new(StudentListJSON.new)
stud_list_json.add_student(student1)
stud_list_json.add_student(student2)
stud_list_json.add_student(student3)
stud_list_json.add_student(student4)
stud_list_json.add_student(student5)
stud_list_json.save_to_file('./Lab_2/students.json')

stud_list_json.load_from_file('./Lab_2/students.json')

puts "Успешно записано и прочитано #{stud_list_json.student_count} студентов:"

puts '--------------------------------'
puts 'Тест StudentsList (YAML):'

stud_list_yaml = StudentListBase.new(StudentListYaml.new)
stud_list_yaml.add_student(student1)
stud_list_yaml.add_student(student2)
stud_list_yaml.add_student(student3)
stud_list_yaml.add_student(student4)
stud_list_yaml.add_student(student5)
stud_list_yaml.save_to_file('./Lab_2/students.yaml')

stud_list_yaml.load_from_file('./Lab_2/students.yaml')

puts "Успешно записано и прочитано #{stud_list_yaml.student_count} студентов:"


puts '--------------------------------'
puts 'Тест StudentsList (TXT):'

stud_list_txt = StudentListBase.new(StudentListTxt.new)
stud_list_txt.add_student(student1)
stud_list_txt.add_student(student2)
stud_list_txt.add_student(student3)
stud_list_txt.add_student(student4)
stud_list_txt.add_student(student5)
stud_list_txt.save_to_file('./Lab_2/students.txt')

stud_list_txt.load_from_file('./Lab_2/students.txt')

puts "Успешно записано и прочитано #{stud_list_txt.student_count} студентов:"