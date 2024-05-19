$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'grade_calculator'

calculator = GradeCalculator::Calculator.new('grades.json')
average = calculator.calculate_average
letter_grade = calculator.average_letter_grade

puts "Average Grade: #{average}"
puts "Letter Grade: #{letter_grade}"

puts "Students Grades:"
calculator.student_grades.each do |student|
  puts "Name: #{student[:name]}, Grade: #{student[:grade]}, Letter Grade: #{student[:letter]}"
end
