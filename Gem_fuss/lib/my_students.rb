# frozen_string_literal: true

require_relative "my_students/version"

module MyStudents
  Dir[File.dirname(__FILE__) + '/source/**/*.rb'].each { |file|
    puts file
    require file
  }
end