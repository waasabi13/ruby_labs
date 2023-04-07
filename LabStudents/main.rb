require_relative 'models/student'
require_relative 'models/student_short'
require_relative 'repositories/containers/data_table'

def read_from_txt(file_path)
  raise ArgumentError, 'File not found' unless File.exist?(file_path)

  stud_file = File.open(file_path, 'r')
  result = ''
  stud_file.each do |line|
    result << line
  end
  stud_file.close
  students_list = []
  stud_list = JSON.parse(result)

  stud_list['StudentList'].each do |obj|
    students_list << Student.init_from_json(obj.to_json)
  end
  students_list
end

def write_to_txt(file_path, student_list)
  result = '{"StudentList":['
  student_list.each do |student|
    result += student.to_json + ","
  end
  result = result.chop + "]}"
  File.write(file_path, result)
end

# student1 = Student.new('Полетов', 'Разбор', 'Алексеевич')
# student2 = Student.new('Пиндосов', 'Облом', 'Баракович', { id: 1, telegram: '@fakk_usa' })
# student3 = Student.new('Атому', 'Ли', 'Ядала', {email: 'goaloffway@mail.ru', git: '@vitaliyg' })
# student4 = Student.new('Гераклов', 'Поход', 'Подвигоевич', { id: 12, phone: '79698876534' })
# student5 = Student.new('Братанов', 'Друган', 'Кентович', { id: 77, phone: '+7 (777)-777-77-77' })
#
# student_list = [student1, student2, student3, student4, student5]
#
# #puts read_from_txt('/Users/kirilltitov/RubymineProjects/ruby_labs/LabStudents/student_list.txt')
# write_to_txt('/Users/kirilltitov/RubymineProjects/ruby_labs/LabStudents/new_student_list.txt', student_list)
#
# st_test = StudentShort.new(student3)
#
# puts st_test.contact

test = [[1, 'Test'], [2, 'tesT']]
test_table = DataTable.new(test)
puts test_table
puts test_table.get_item(0, 1)
