# frozen_string_literal: true
require 'glimmer-dsl-libui'
class StudentCreateForm
  include Glimmer
  data = [
    ['task 5', -1],
  ]

  def create
    window('Общага', '500', '300'){
      vertical_box {
        table {
          text_column('Task')
          progress_bar_column('Progress')

          cell_rows data # implicit data-binding
        }
      }
    }
  end

end
