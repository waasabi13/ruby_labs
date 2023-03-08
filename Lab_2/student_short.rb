# frozen_string_literal: true
require 'json'

class StudentShort
  # стандартные геттеры и сеттеры для класса
  attr_reader :id, :git, :contact

  def initialize(student)
    self.id = student.id

    @last_name = student.last_name
    @initials = "#{student.first_name[0]}. #{student.paternal_name[0]}."
    @git= student.git unless student.git.nil?
    @contact = student.contact
  end

  def self.from_student(id, str)
    result = JSON.parse(str)
    raise ArgumentError, 'Missing fields: last_name, first_name, paternal_name' unless result.key?('first_name') && result.key?('last_name') && result.key?('paternal_name')

    # TODO: дописать конструктор
    # StudentShort.new(Student.new())
  end

  def last_name_and_initials
    "#{@last_name} #{@initials}"
  end

  private

  def set_contacts(contacts)
    # TODO: переписать
    return @contact = contacts['phone'] if contacts.key?('phone')
    return @contact = contacts['telegram'] if contacts.key?('telegram')
    @contact = contacts['email'] if contacts.key?('email')
  end
end
