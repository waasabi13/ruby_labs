# frozen_string_literal: true
require 'sqlite3'
require_relative '../repositories/student_list'
require_relative '../repositories/student_list_db_adapter'
class StudentCreateFormController
  def initialize(view, existing_student)
    @view = view
    @existing_student = existing_student
  end

  def on_view_created
    begin
      #raise StandardError "Test"
      @student_rep = StudentList.new(StudentListDbAdapter.new)
    rescue SQLException::SQLException => e
      on_db_conn_error(e)
    end
  end

  def save_student(student)
    if @existing_student.nil?
      @student_rep.add_student(student)
    else
      @student_rep.replace_student(@existing_student[:id], student)
    end
  end

  def on_db_conn_error(e)
    script = "display dialog \"Отсутсвует подключение к БД #{e.message}\" with title \"Ошибка\""
    system 'osascript', '-e', script
    exit(false)
  end
end
