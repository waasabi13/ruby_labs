# frozen_string_literal: true

require 'json'
require_relative 'student_short'

class Student < StudentShort
  # стандартные геттеры и сеттеры для класса
  attr_writer :id
  attr_reader :phone, :telegram, :email, :first_name, :paternal_name

  #валидаТОР номера телефона
  def self.valid_phone?(phone)
    phone.match(/^\+?[7,8] ?\(?\d{3}\)?-?\d{3}-?\d{2}-?\d{2}$/)
  end

  #валидаТОР имени
  def self.valid_name?(name)
    name.match(/^[А-Я][а-я]+$/)
  end

  #валидаТОР профиля
  def self.valid_account?(account)
    account.match(/^@[A-Za-z0-9\-_]+$/)
  end

  def self.valid_email?(email)
    email.match(/^[A-Za-z0-9\-_]+@[A-Za-z]+\.([A-Za-z]+\.)*[A-Za-z]+$/)
  end

  # конструктор
  def initialize(last_name, first_name, paternal_name, id: nil, git: nil, phone: nil, email: nil, telegram: nil)
    self.last_name = last_name
    self.first_name = first_name
    self.paternal_name = paternal_name
    self.id = id
    self.git = git
    set_contacts(phone: phone, email: email, telegram: telegram)
  end

  # конструктор из json-строки
  def self.init_from_json(str)
    result = JSON.parse(str)
    raise ArgumentError, 'Missing fields: last_name, first_name, paternal_name' unless result.key?('first_name') && result.key?('last_name') && result.key?('paternal_name')

    last_name = result.delete('last_name')
    first_name = result.delete('first_name')
    paternal_name = result.delete('paternal_name')
    Student.new(last_name, first_name, paternal_name, **result.transform_keys(&:to_sym))
  end

    #сеттер
  def phone=(phone)
    raise ArgumentError, "Incorrect value: phone=#{phone}!" if !phone.nil? && !Student.valid_phone?(phone)

    @phone = phone
  end

  def first_name=(first_name)
    raise ArgumentError, "Incorrect value: first_name=#{first_name}!" if !first_name.nil? && !Student.valid_name?(first_name)

    @first_name = first_name
  end

  def last_name=(last_name)
    raise ArgumentError, "Incorrect value: last_name=#{last_name}!" if !last_name.nil? && !Student.valid_name?(last_name)

    @last_name = last_name
  end

  def paternal_name=(paternal_name)
    raise ArgumentError, "Incorrect value: paternal_name=#{paternal_name}!" if !paternal_name.nil? && !Student.valid_name?(paternal_name)

    @paternal_name = paternal_name
  end

  def git=(git)
    raise ArgumentError, "Incorrect value: git=#{git}!" if !git.nil? && !Student.valid_account?(git)

    @git = git
  end

  def telegram=(telegram)
    raise ArgumentError, "Incorrect value: telegram=#{telegram}!" if !telegram.nil? && !Student.valid_account?(telegram)

    @telegram = telegram
  end

  def email=(email)
    raise ArgumentError, "Incorrect value: email=#{email}!" if !email.nil? && !Student.valid_email?(email)

    @email = email
  end

  def last_name_and_initials
    "#{last_name} #{first_name[0]}. #{paternal_name[0]}."
  end

  def short_info
    "#{short_name}, #{contact}, git= #{git}"
  end

  def git?
    !git.nil?
  end

  def contact?
    !email.nil? || !phone.nil? || !telegram.nil?
  end

  def contact
    return @contact = "phone= #{phone}" unless phone.nil?
    return @contact = "telegram= #{telegram}" unless telegram.nil?
    return @contact = "email= #{email}" unless email.nil?

    nil
  end

  def validate
    git? && contact?
  end

  def set_contacts(phone: nil, telegram: nil, email: nil)
    self.phone = phone if phone
    self.telegram = telegram if telegram
    self.email = email if email
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
