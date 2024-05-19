require 'json'

module GradeCalculator
  class Calculator
    def initialize(json_file)
      @json_file = json_file
      @data = parse_json
    end

    def parse_json
      file = File.read(@json_file)
      JSON.parse(file)
    end

    def calculate_average
      total_score = @data.sum { |student| student['grade'].to_f }
      total_score / @data.size
    end

    def letter_grade(score)
      case score
      when 90...101
            "AA"
        when 85...90
            "BA"
        when 80...85
            "BB"
        when 75...80
            "CB"
        when 70...75
            "CC"
        when 65...70
            "DC"
        when 60...65
            "DD"
        when 50...60
            "FD"
        when 0...50
            "FF"
      end
    end

    def average_letter_grade
      avg_score = calculate_average
      letter_grade(avg_score)
    end

    def student_grades
      @data.map do |student|
        name = student['name']
        grade = student['grade'].to_f
        letter = letter_grade(grade)
        { name: name, grade: grade, letter: letter }
      end
    end
  end
end
