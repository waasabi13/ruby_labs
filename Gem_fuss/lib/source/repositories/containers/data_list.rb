# frozen_string_literal: true
require_relative 'data_table'

class DataList

  private_class_method :new

  attr_writer :objects_list

  def initialize(objects)
    self.objects_list = objects
    @observers = []
  end

  def add_observer(observer)
    @observers.append(observer)
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end
  def notify
    @observers.each { |observer| observer.on_datalist_changed(get_data) }
  end

  # добавить айди в выборку
  def select_elem(number)
    self.selected_object = number
  end

  def selected_id
    objects_list[selected_object].id
  end

  # шаблон
  def get_data
    index_id=0
    dt = objects_list.inject([]) do |res, object|
      row=[index_id]
      row.append(*table_fields(object))
      index_id+=1
      res<<row
    end
    DataTable.new(dt)
  end


  def replace_objects(objects)
    self.objects_list = objects.dup
    notify
  end

  protected

  # должен быть реализован в детях
  def get_names; end

  # теперь этот метод необходимо переопределять у наследников(если я правильно понял принцип паттерна)
  def table_fields(object)
    []
  end

  private

  attr_reader :objects_list
  attr_accessor :selected_object
end
