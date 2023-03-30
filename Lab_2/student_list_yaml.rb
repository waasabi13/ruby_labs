# frozen_string_literal: true

require_relative 'student_list_strategy'
require 'yaml'

class StudentListYaml<StudentListStrategy
  public_class_method :new


  def str_to_list(str)
    YAML.safe_load(str).map { |h| h.transform_keys(&:to_sym) }
  end

  def list_to_str(hash_list)
    hash_list.map { |h| h.transform_keys(&:to_s) }.to_yaml
  end
end
