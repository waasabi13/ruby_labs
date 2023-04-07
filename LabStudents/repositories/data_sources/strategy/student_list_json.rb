# frozen_string_literal: true

require_relative '../student_list_strategy'
require 'json'
class StudentListJSON < StudentListStrategy
  public_class_method :new


  def str_to_list(str)
    JSON.parse(str, { symbolize_names: true })
  end

  def list_to_str(list)
    JSON.generate(list)
  end
end
