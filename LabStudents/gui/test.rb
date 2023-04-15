require 'glimmer-dsl-libui'

include Glimmer

data = [
  ['task 1', 0],
  ['task 2', 15],
  ['task 3', 100],
  ['task 4', 75],
  ['task 5', -1],
]

window('Task Progress', 300, 200) {
  vertical_box {
    table {
      text_column('Task')
      progress_bar_column('Progress')

      cell_rows data
    }

    button('Mark All As Done') {
      stretchy false

      on_clicked do
        data.each_with_index do |row_data, row|
          data[row][1] = 100
        end
      end
    }
  }
}.show