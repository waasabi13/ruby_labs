#frozen_string_literal: true

class DataTable
  def initialize(table)
    self.table = table
  end

  private
  attr_accessor :table

end