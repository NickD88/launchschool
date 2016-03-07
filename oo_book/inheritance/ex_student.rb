require 'pry'

class Student

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(name)
    grade > name.grade
  end

  protected

  def grade
    @grade
  end

end

joe = Student.new('joe', 92)
bob = Student.new('bob', 85)
puts "Well done!" if joe.better_grade_than?(bob)
