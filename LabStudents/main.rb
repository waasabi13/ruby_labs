require_relative 'models/student'
require_relative 'models/student_short'
require_relative 'repositories/containers/data_table'
require 'yaml'
require 'sqlite3'
require_relative 'repositories/student_list_db_adapter'

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

db = StudentListDbAdapter.new
student = Student.new('Гераклов', 'Поход', 'Подвигоевич', {phone: '79698876534' })
#db.add_student(student)
puts db.student_by_id(4)
puts db.student_count