
require_relative '../gui/main_window'
require_relative '../gui/logic_window'
require_relative '../repositories/student_list'
require_relative '../repositories/student_list_db_adapter'
require_relative '../repositories/containers/data_list_student_short'
require 'glimmer-dsl-libui'
class StudentListController
  def initialize(view)
    @view = view
    @data_list = DataListStudentShort.new([])
    @data_list.add_observer(@view)
  end

  def on_view_created
    @student_list=StudentList.new(StudentListDbAdapter.new)
  end

  def show_view
    @view.create.show
  end

  def refresh_data(k, n)
    begin
    @data_list = @student_list.k_n_student_short_list(k, n, @data_list)
    @view.update_student_count(@student_list.student_count)
    rescue
      on_db_conn_error
      end
  end

  # разрыв соединения с бд
  def on_db_conn_error
    message_box = MessageBox.new(
      title: "Ошибка подключения к базе данных",
      text: "Произошла ошибка при подключении к базе данных. Проверьте настройки подключения и повторите попытку.",
      parent: @view.get_root,
      buttons: ['Выйти']
    )
    message_box.on_confirm do
      exit
    end
    message_box.show
  end
end