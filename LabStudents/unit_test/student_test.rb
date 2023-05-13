# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../models/student'
require 'json'
class StudentTest<Minitest::Test
  def setup
    @student = Student.new(
      'Тестов',
      'Тест',
      'Тестович',
      id: 404,
      phone: '71111111111',
      telegram: '@test',
      email: 'test@test.ru',
      git: '@test'
    )
  end

  def teardown
    # метод который отвечает за то, что делать после выполнения всех тестов
  end

  def test_student_create
    assert @student.last_name == 'Тестов'
    assert @student.first_name == 'Тест'
    assert @student.paternal_name == 'Тестович'
    assert @student.id == 404
    assert @student.phone == '71111111111'
    assert @student.telegram == '@test'
    assert @student.email == 'test@test.ru'
    assert @student.git == '@test'
  end

  def test_student_empty_fields
    Student.new('Паттернов', 'Шаблон', 'Одиночкович')
  end

  def test_student_has_contacts
    assert @student.contact? == true
  end

  def test_student_has_git
    assert @student.git? == true
  end

  def test_student_set_contacts
    stud = Student.new('Городецкий', 'Эдуард', 'Романович')
    stud.set_contacts(phone: '77777777777', telegram: '@boss777', email: 'likeaboss@gmail.com')

    assert stud.phone == '77777777777'
    assert stud.telegram == '@boss777'
    assert stud.email == 'likeaboss@gmail.com'
  end

  def test_student_last_name_and_initials
    assert @student.last_name_and_initials == 'Тестов Т. Т.'
  end

  def test_student_short_info
    should_be = JSON.generate({
                                last_name_and_initials: @student.last_name_and_initials,
                                contact: {type: :phone, value: '71111111111'},
                                git: '@test'
                              })
    assert @student.short_info == should_be
  end

  def test_student_from_and_to_hash
    test_hash = {
      last_name: 'Манукьян',
      first_name: 'Артур',
      paternal_name: 'Вагинакович',
      id: 2,
      phone: '79991112233',
      telegram: '@ilovebrawlstars',
      email: 'nowrim@mail.ru',
      git: '@archii'
    }

    stud = Student.from_hash(test_hash)

    assert stud.last_name == 'Манукьян'
    assert stud.first_name == 'Артур'
    assert stud.paternal_name == 'Вагинакович'
    assert stud.id == 2
    assert stud.phone == '79991112233'
    assert stud.telegram == '@ilovebrawlstars'
    assert stud.email == 'nowrim@mail.ru'
    assert stud.git == '@archii'

    assert stud.to_hash == test_hash
  end
end
