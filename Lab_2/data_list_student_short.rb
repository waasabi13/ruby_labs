# frozen_string_literal: true

require_relative 'data_list'
class DataListStudentShort < DataList
  public_class_method :new

  # переопределенный метод из предка
  def get_names
    ["last_name_and_initials", "git", "contact"]
  end

  protected

  # паблон шаттерн
  def table_fields(object)
    [object.last_name_and_initials, object.git, object.contact]
  end
end
