class School

  def initialize
    @students = {}
  end

  def add (name, grade)
    @students[grade] = [] if @students[grade] == nil
    (@students[grade] << name).sort!
  end

  def to_h
    @students.sort.to_h
  end

  def grade(number)
    return [] if @students[number] == nil
    @students[number]
  end
end
