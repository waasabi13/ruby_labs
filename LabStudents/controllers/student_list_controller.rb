
require_relative '../gui/main_window'
require_relative '../gui/logic_window'
require_relative '../repositories/student_list'
require_relative '../repositories/student_list_db_adapter'
require_relative '../repositories/student_list_file_adapter'
require_relative '../repositories/data_sources/strategy/student_list_json'
require_relative '../repositories/containers/data_list_student_short'
require 'glimmer-dsl-libui'

class StudentListController
  def initialize(view)
    @view = view
    @data_list = DataListStudentShort.new([])
    @data_list.add_observer(@view)
  end

  def on_view_created
    #@student_list = StudentList.new(StudentListFileAdapter.new(StudentListJSON.new, './LabStudents/test_data/students.json'))
    @student_list=StudentList.new(StudentListDbAdapter.new)
  end

  def show_view
    @view.create.show
  end

  def refresh_data(k, n)
    begin
      #raise StandardError, "Error DB"
    @data_list = @student_list.k_n_student_short_list(k, n, @data_list)
    @view.update_student_count(@student_list.student_count)
    rescue
       on_db_conn_error
    end
  end

  # разрыв соединения с бд
  def on_db_conn_error
    script = 'display dialog "Отсутсвует подключение к БД" with title "Ошибка"'
    system 'osascript', '-e', script
    exit(false)
  end
end