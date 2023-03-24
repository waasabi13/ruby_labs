# frozen_string_literal: true

require_relative 'student_list_base'
require 'json'
class StudentListJSON < StudentListBase
  public_class_method :new

  protected

  def str_to_list(str)
    JSON.parse(str, { symbolize_names: true })
  end

  def list_to_str(list)
    JSON.generate(list)
  end
end
