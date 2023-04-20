# frozen_string_literal: true

class LogicWindow
  include Glimmer::LibUI::CustomControl

  body {
    horizontal_box {

      # 1 область
      vertical_box {
        form {
          stretchy false

          @filter_last_name_initials = entry {
            stretchy false
            label 'Фамилия И. О.'
          }

          @filters = {}
          fields = [[:git, 'Гит'], [:email, 'Почта'], [:phone, 'Телефон'], [:telegram, 'Телеграм']]

          fields.each do |field|
            @filters[field[0]] = {}

            @filters[field[0]][:combobox] = combobox {
              stretchy false
              label "#{field[1]} имеется?"
              items ['Не важно', 'Да', 'Нет']
              selected 0

              on_selected do
                if @filters[field[0]][:combobox].selected == 1
                  @filters[field[0]][:entry].read_only = false
                else
                  @filters[field[0]][:entry].text = ''
                  @filters[field[0]][:entry].read_only = true
                end
              end
            }

            @filters[field[0]][:entry] = entry {
              stretchy false
              label field[1]
              read_only true
            }
          end
        }
      }

      #2 область
      vertical_box {
        @table = table {

          text_column('Фамилия И. О.')
          text_column('Контакт')
          text_column('Гит')

          editable false
        }

        @pages = horizontal_box {
          stretchy false

          button('1')
          button('2')
          label('...') { stretchy false }
          button('15')
        }
      }

      # 3 область
      vertical_box {
        stretchy true

        button('Добавить') { stretchy false }
        button('Изменить') { stretchy false }
        button('Удалить') { stretchy false }
        button('Обновить') { stretchy false }
      }
    }
  }
end
