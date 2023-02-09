# frozen_string_literal: true

class Student
  # стандартные геттеры и сеттеры для класса
  attr_accessor :last_name, :first_name, :paternal_name, :id, :phone, :git, :telegram, :email

  # конструктор
  def initialize(last_name, first_name, paternal_name, options = {})
    self.last_name = last_name
    self.first_name = first_name
    self.paternal_name = paternal_name
    self.id = options[:id]
    self.phone = options[:phone]
    self.git = options[:git]
    self.telegram = options[:telegram]
    self.email = options[:email]
  end

  def to_s
    result = "#{last_name} #{first_name} #{paternal_name}"
    result += " id=#{id}" unless id.nil?
    result += " phone=#{phone}" unless phone.nil?
    result += " git=#{git}" unless git.nil?
    result += " telegram=#{telegram}" unless telegram.nil?
    result += " email=#{email}" unless email.nil?
    result
  end
end
