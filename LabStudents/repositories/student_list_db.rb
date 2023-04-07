require_relative 'db_university'
class StudentsListDB

  # новый конструктор
  def initialize
    self.client = DBUniversity.instance
  end

  # вернуть студента по ид
  def student_by_id(student_id)
    hash = client.prepare_exec('SELECT * FROM students WHERE id = ?',student_id).first
    print(hash)
    return nil if hash.nil?

    Student.from_hash(hash)

  end

  def get_k_n_student_short_list(k,n)

    students = client.prepare_exec('SELECT * FROM students LIMIT ? OFFSET ?',(k-1)*n,n)
    slice = students.map { |h| StudentShort.new(Student.from_hash(h)) }

    DataListStudentShort.new(slice)
  end

  # добавление студента
  def add_student(student)
    stmt = client.prepare_exec('insert into students (first_name, last_name, paternal_name, phone, telegram, email, git) VALUES (?, ?, ?, ?, ?, ?, ?)', *student_fields(student))
  end

  # отчисление студента
  def remove_student(student_id)
    client.prepare_exec('DELETE FROM students WHERE id = ?', student_id)
  end

  # обновление студента
  def replace_student(student_id, student)
    template = 'UPDATE students SET first_name=?, last_name=?, paternal_name=?, phone=?, telegram=?, email=?, git=? WHERE id=?'
    client.prepare_exec(template, *student_fields(student), student_id)

  end

  def student_count
    client.query('SELECT COUNT(id) FROM students').next[0]
  end


  private

  attr_accessor :client

  def student_fields(student)
    [student.first_name, student.last_name,  student.paternal_name, student.phone, student.telegram, student.email, student.git]
  end
end