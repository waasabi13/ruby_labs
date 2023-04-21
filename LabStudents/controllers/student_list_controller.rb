
require_relative '../gui/main_window'
require_relative '../repositories/student_list'
require_relative '../repositories/student_list_db_adapter'
class StudentListController
  def initialize(view)
    @view = view
    @student_list=StudentList.new(StudentListDbAdapter.new)
  end

  def show_view
    @view.create.show
  end
end