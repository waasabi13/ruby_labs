# frozen_string_literal: true

require 'glimmer-dsl-libui'
require_relative 'logic_window'

class MainWindow
  include Glimmer

  def initialize
    @logic_tab = LogicWindow.new
  end
  def create
    window('Универ', 1200, 700) {
      margined true
      tab {
        tab_item('Студенты') {

          @logic_tab.create
        }

        tab_item('Вкладка 2') { }
        tab_item('Вкладка 3') { }
      }
    }
  end
end
