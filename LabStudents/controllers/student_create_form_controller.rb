# frozen_string_literal: true
require 'sqlite3'
require_relative '../repositories/student_list'
require_relative '../repositories/student_list_db_adapter'
class StudentCreateFormController
  def initialize(controller)
    @controller = controller
  end

  def on_view_created
    begin
      @student_rep = StudentList.new(StudentListDbAdapter.new)
    rescue SQLException::SQLException => e
      on_db_conn_error(e)
    end
  end

  def view=(view)
    @view = view
  end

  def process_fields(fields)
    last_name = fields.delete(:last_name)
    first_name = fields.delete(:first_name)
    paternal_name = fields.delete(:paternal_name)

    # TODO написать пользователю что он не прав
    return if last_name.nil? || first_name.nil? || paternal_name.nil?

    student = Student.new(last_name, first_name, paternal_name, **fields)

    @student_rep.add_student(student)
    @view.close
    @controller.view.refresh_current_page
  end

  def on_db_conn_error(e)
    script = "display dialog \"Отсутсвует подключение к БД #{e.message}\" with title \"Ошибка\""
    system 'osascript', '-e', script
    exit(false)
  end
end
