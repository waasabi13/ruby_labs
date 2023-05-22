
require_relative '../gui/main_window'
require_relative '../gui/logic_window'
require_relative '../repositories/student_list'
require_relative '../repositories/student_list_db_adapter'
require_relative '../repositories/student_list_file_adapter'
require_relative '../repositories/data_sources/strategy/student_list_json'
require_relative '../repositories/containers/data_list_student_short'
require_relative 'student_create_form_controller'
require_relative 'student_edit_form_controller'
require_relative 'student_git_form_controller'
require_relative 'student_contact_form_controller'
require_relative '../logger/logger_holder'
require 'glimmer-dsl-libui'

class StudentListController

  attr_reader :view
  def initialize(view)
    LoggerHolder.instance.debug('StudentListController: init start')
    @view = view
    @data_list = DataListStudentShort.new([])
    @data_list.add_observer(@view)
    LoggerHolder.instance.debug('StudentListController: init done')
  end

  def on_view_created
    #@student_list = StudentList.new(StudentListFileAdapter.new(StudentListJSON.new, './LabStudents/test_data/students.json'))

    begin
      @student_list=StudentList.new(StudentListDbAdapter.new)
      LoggerHolder.instance.debug('StudentListController: view create')
    rescue
      on_db_conn_error
      end
  end


  def show_view
    @view.create.show
  end

  def show_add_student()
    LoggerHolder.instance.debug('StudentListController: show add student')
    controller = StudentCreateFormController.new(self)
    view = StudentCreateForm.new(controller)
    controller.view=view
    view.create.show
  end

  def show_edit_student(current_page, per_page, selected_row)
    LoggerHolder.instance.debug('StudentListController: show edit name')
    student_num = selected_row
    @data_list.select_elem(student_num)
    student_id = @data_list.selected_id
    controller = StudentEditFormController.new(self, student_id)
    view = StudentCreateForm.new(controller)
    controller.view=view
    view.create.show
  end

  def show_git_student(current_page, per_page, selected_row)
    LoggerHolder.instance.debug('StudentListController: show edit git')
    student_num = selected_row
    @data_list.select_elem(student_num)
    student_id = @data_list.selected_id
    controller = StudentGitFormController.new(self, student_id)
    view = StudentCreateForm.new(controller)
    controller.view=view
    view.create.show
  end

  def show_contact_student(current_page, per_page, selected_row)
    LoggerHolder.instance.debug('StudentListController: show edit git')
    student_num = selected_row
    @data_list.select_elem(student_num)
    student_id = @data_list.selected_id
    controller = StudentContactFormController.new(self, student_id)
    view = StudentCreateForm.new(controller)
    controller.view=view
    view.create.show
  end

  def delete_selected(current_page, per_page, selected_row)
    # begin
    #student_num = (current_page - 1) * per_page + selected_row
    student_num = selected_row
    puts student_num
      @data_list.select_elem(student_num)
      student_id = @data_list.selected_id
      @student_list.remove_student(student_id)
    # rescue
    # on_db_conn_error
    # end
  end
  def refresh_data(k, n)
    # begin
      #raise StandardError, "Error DB"
    @data_list = @student_list.k_n_student_short_list(k, n, @data_list)
    @view.update_student_count(@student_list.student_count)
    # rescue
    #    on_db_conn_error
    # end
  end

  # разрыв соединения с бд
  def on_db_conn_error
    script = 'display dialog "Отсутсвует подключение к БД" with title "Ошибка"'
    system 'osascript', '-e', script
    exit(false)
  end
end