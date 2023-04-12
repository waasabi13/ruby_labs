require_relative '../models/student'
require_relative '../models/student_short'
require_relative '../repositories/containers/data_list_student_short'
require_relative '../repositories/data_sources/student_list_base'
require_relative '../repositories/data_sources/strategy/student_list_txt'
require_relative '../repositories/data_sources/strategy/student_list_json'
require_relative '../repositories/data_sources/strategy/student_list_yaml'
require_relative '../repositories/student_list'
require_relative '../repositories/student_list_file_adapter'
require 'json'

student1 = Student.new('Полетов', 'Разбор', 'Алексеевич')
student2 = Student.new('Пиндосов', 'Облом', 'Баракович', { id: 1, telegram: '@fakk_usa' })
student3 = Student.new('Атому', 'Ли', 'Ядала', {email: 'goaloffway@mail.ru', git: '@vitaliyg' })
student4 = Student.new('Гераклов', 'Поход', 'Подвигоевич', { id: 12, phone: '79698876534' })
student5 = Student.new('Братанов', 'Друган', 'Кентович', { id: 77, phone: '+7 (777)-777-77-77' })

# puts '--------------------------------'
# puts 'Тест StudentsList (JSON):'
#
# stud_list_json = StudentListBase.new(StudentListJSON.new)
# stud_list_json.add_student(student1)
# stud_list_json.add_student(student2)
# stud_list_json.add_student(student3)
# stud_list_json.add_student(student4)
# stud_list_json.add_student(student5)
# stud_list_json.save_to_file('./LabStudents/test_data/students.json')
#
# stud_list_json.load_from_file('./LabStudents/test_data/students.json')
#
# puts "Успешно записано и прочитано #{stud_list_json.student_count} студентов:"
#
# puts '--------------------------------'
# puts 'Тест StudentsList (YAML):'
#
# stud_list_yaml = StudentListBase.new(StudentListYaml.new)
# stud_list_yaml.add_student(student1)
# stud_list_yaml.add_student(student2)
# stud_list_yaml.add_student(student3)
# stud_list_yaml.add_student(student4)
# stud_list_yaml.add_student(student5)
# stud_list_yaml.save_to_file('./LabStudents/test_data/students.yaml')
#
# stud_list_yaml.load_from_file('./LabStudents/test_data/students.yaml')
#
# puts "Успешно записано и прочитано #{stud_list_yaml.student_count} студентов:"
#
#
# puts '--------------------------------'
# puts 'Тест StudentsList (TXT):'
#
# stud_list_txt = StudentListBase.new(StudentListTxt.new)
# stud_list_txt.add_student(student1)
# stud_list_txt.add_student(student2)
# stud_list_txt.add_student(student3)
# stud_list_txt.add_student(student4)
# stud_list_txt.add_student(student5)
# stud_list_txt.save_to_file('./LabStudents/test_data/students.txt')
#
# stud_list_txt.load_from_file('./LabStudents/test_data/students.txt')
#
# puts "Успешно записано и прочитано #{stud_list_txt.student_count} студентов:"

def test_adapter(student_rep)
  puts "В репозитории #{student_rep.student_count} студентов."
  puts "Студент с id=1: #{student_rep.student_by_id(1)}"
  student_rep.remove_student(4)
  puts "Теперь в репозитории #{student_rep.student_count} студента."
  student = Student.new('Манукьян', 'Артур', 'Вагинакович', { git: '@archipunkrockboy', phone: '+7 (777)-123-44-55' })
  added_id=student_rep.add_student(student)
  puts "Теперь в репозитории #{student_rep.student_count} студентов."
  student.git = '@narot'
  puts student.to_s
  student_rep.replace_student(6,student)
  puts "Измененный студент: #{student_rep.student_by_id(6)}"
  puts 'Страница 1:'
  puts student_rep.k_n_student_short_list(1, 3).get_data.inspect

end

puts '--------------------------------'
puts '=> Тест StudentRepository (JSON) <='
rep_json =StudentList.new(StudentListFileAdapter.new(StudentListJSON.new, './LabStudents/test_data/students.json'))
test_adapter(rep_json)