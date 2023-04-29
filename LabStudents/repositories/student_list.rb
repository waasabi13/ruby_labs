# frozen_string_literal: true

class StudentList

  # конструктор
  def initialize(data_adapter)
    @data_adapter = data_adapter
  end

  # получить студента по id
  def student_by_id(student_id)
    @data_adapter.student_by_id(student_id)
  end


  #добавление студента
  def add_student(student)
    @data_adapter.add_student(student)
  end

  #отчисление студента
  def remove_student(student_id)
    @data_adapter.remove_student(student_id)
  end

  #замена студента
  def replace_student(student_id, student)
    @data_adapter.replace_student(student_id, student)
  end

  #подсчет количества студентов
  def student_count
    @data_adapter.student_count
  end

  #получение n элементов k страницы
  def k_n_student_short_list(k,n, data_list)
    @data_adapter.k_n_student_short_list(k,n,data_list)
  end
end
