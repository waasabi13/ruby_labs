# frozen_string_literal: true

require_relative 'student_list_base'
require 'json'
class StudentListTxt < StudentListBase
  public_class_method :new

  protected

  def str_to_list(str)
    transform_to_hashes(str.split("\n"))
  end

  def list_to_str(list)
    transform_to_string(list)
  end

  private

  def transform_to_hashes(list_of_strings)
    list_of_hashes = []
    list_of_strings.each do |string|
      hash = {}
      string.split(',').each do |attribute|
        key, value = attribute.split(':').map(&:strip)
        hash[key.to_sym] = value
      end
      list_of_hashes << hash
    end
    list_of_hashes
  end

  def transform_to_string(hashes)
    lines = hashes.map do |hash|
      hash.map { |key, value| "#{key}: #{value.inspect}" }.join(", ")
    end
    lines.join("\n")
  end
end
