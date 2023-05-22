# frozen_string_literal: true

class DataTable

  attr_reader :rows_count, :cols_count

  def initialize(table)

    self.rows_count = table.length
    max_cols = 0
    table.each do |row|
      max_cols = row.length if row.size > max_cols
    end
    self.cols_count = max_cols
    self.table = table
  end

  def get_item(row, col)
    return nil if row >= rows_count || row.negative?
    return nil if col >= cols_count || col.negative?

    table[row][col]
  end

  def to_my_array
    table.dup
  end

  def to_s
    table.map { |row| "[#{row.join(', ')}]" }.join("\n")
  end

  private

  attr_accessor :table
  attr_writer :rows_count, :cols_count

end
