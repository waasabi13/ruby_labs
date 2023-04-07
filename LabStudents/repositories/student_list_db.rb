# frozen_string_literal: true

class StudentListDB

  #стандартный коструктор
  def initialize(db_file_path)
    self.client = SQLite3::Database.open db_file_path
  end

  # получить студента по id
  def student_by_id(student_id)
    client.results_as_hash = true
    hash = client.prepare('SELECT * FROM students WHERE id = ?').execute(student_id).first
    client.results_as_hash = false
    return nil if hash.nil?

    Student.from_hash(hash)
  end


  #добавление студента
  def add_student(student)
    stmt = client.prepare('insert into students (first_name, last_name, paternal_name, phone, telegram, mail, git) VALUES (?, ?, ?, ?, ?, ?, ?)')
    stmt.execute(*student_fields(student))
    self.client.query('SELECT seq from sqlite_sequence where name = "students"').first.first[1]
  end

  #отчисление студента
  def remove_student(student_id)
    stmt = self.client.prepare('DELETE FROM students WHERE id = ?')
    stmt.execute(student_id)
  end

  #обновление студента
  def replace_student(student_id, student)
    stmt = client.prepare('UPDATE students SET first_name=?, last_name=?, paternal_name=?, phone=?, telegram=?, mail=?, git=? WHERE id=?')
    stmt.execute(*student_fields(student), student_id)
  end

  #подсчет количества студентов
  def student_count
    stm = self.client.prepare "Select COUNT(id) from students"
    stm.execute.next[0]
  end

  def get_k_n_student_short_list(k,n)
    self.client.results_as_hash = true
    students = client.prepare('SELECT * FROM students LIMIT ? OFFSET ?').execute((k-1)*n,n)
    slice = students.map { |h| StudentShort.new(Student.from_hash(h)) }
    self.client.results_as_hash = false
    DataListStudentShort.new(slice)
  end

  private

  attr_accessor :client

  def student_fields(student)
    [student.first_name, student.last_name,  student.paternal_name, student.phone, student.telegram, student.mail, student.git]
  end
end
