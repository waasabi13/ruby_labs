# frozen_string_literal: true

class StudentContactFormController
  def initialize(parent_controller, existing_student_id)
    @parent_controller = parent_controller
    @existing_student_id = existing_student_id
  end

  def view=(view)
    @view = view
  end

  def on_view_created
    @student_list = StudentList.new(StudentListDbAdapter.new)
    @existing_student = @student_list.student_by_id(@existing_student_id)
    @view.make_readonly(:first_name,:last_name,:paternal_name, :git)
    set_fields(@existing_student)
  end

  def set_fields(student)
    student = student
    puts student
    @view.set_value(:last_name, student.last_name)
    @view.set_value(:first_name, student.first_name)
    @view.set_value(:paternal_name, student.paternal_name)
    @view.set_value(:git, student.git)
    @view.set_value(:telegram, student.telegram)
    @view.set_value(:email, student.email)
    @view.set_value(:phone, student.phone)
  end


  def process_fields(fields)
    new_student = Student.from_hash(fields)

    @student_list.replace_student(@existing_student_id, new_student)

    @view.close
  end
end
