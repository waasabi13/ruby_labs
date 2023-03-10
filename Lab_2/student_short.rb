# frozen_string_literal: true
require 'json'

class StudentShort
  # стандартные геттеры для класса
  attr_reader :id, :git, :contact, :last_name, :initials

  # стандартный конструктор, принимающий аргументов экземпляр класса student
  def initialize(student)
    @id = student.id

    @last_name = student.last_name
    @initials = "#{student.first_name[0]}. #{student.paternal_name[0]}."
    @git = student.git unless student.git.nil?
    @contact = student.contact
  end

  # кастомный конструктор, принимающий на вход id и строку, которая содержит всю остальную инф-ю
  def self.from_str(id, str)
    result = JSON.parse(str)
    raise ArgumentError, 'Missing fields: last_name, first_name, paternal_name' unless result.key?('first_name') &&
      result.key?('last_name') && result.key?('paternal_name')

    StudentShort.new(Student.new(result['last_name'],result['first_name'],result['paternal_name'],id: id,
                                 phone: result['phone'], git: result['git'],
                                 email: result['email'],telegram: result['telegram']))
  end

  # метод возвращающий фамилию и инициалы у объекта
  def last_name_and_initials
    "#{@last_name} #{@initials}"
  end

  # метод возвращающий представление объекта в виде строки
  def to_s
    result = last_name_and_initials
    result += " id= #{id} " unless id.nil?
    result += contact unless contact.nil?
    result
  end

  private

  # def set_contacts(contacts)
  #   return @contact = contacts['phone'] if contacts.key?('phone')
  #   return @contact = contacts['telegram'] if contacts.key?('telegram')
  #   @contact = contacts['email'] if contacts.key?('email')
  # end

end
