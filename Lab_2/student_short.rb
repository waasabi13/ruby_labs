# frozen_string_literal: true
require 'json'

class StudentShort
  # стандартные геттеры и сеттеры для класса
  attr_reader :id, :git, :contact

  def initialize(id, info_str)
    @id = id
    result = JSON.parse(info_str)
    raise ArgumentError, 'Missing fields: last_name, first_name, paternal_name' unless result.key?('first_name') && result.key?('last_name') && result.key?('paternal_name')

    @last_name = result['last_name']
    @initials = "#{result['first_name'][0]}. #{result['paternal_name'][0]}."
    set_contacts(result)
  end

  def self.from_student(student)
    info = { last_name: student.last_name, first_name: student.first_name, paternal_name: student.paternal_name,
             git: student.git, email: student.email, phone: student.phone, telegram: student.telegram }
    StudentShort.new(student.id, JSON.generate(info))
  end



  def last_name_and_initials
    "#{last_name} #{initials}"
  end

  private

  attr_reader :last_name, :initials

  def set_contacts(contacts)
    return @contact = contacts['phone'] if contacts.key?('phone')
    return @contact = contacts['telegram'] if contacts.key?('telegram')

    @contact = contacts['email'] if contacts.key?('email')
  end
end
