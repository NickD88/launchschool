require 'pry'

class SumOfMultiples

  def initialize(*numbers)
    @multiples = numbers
  end

  def self.to(target_num)
    SumOfMultiples.new(3, 5).to(target_num)
  end

  def to(target_num)
    return 0 if target_num <= 1
    (1..target_num - 1).select {|num| multiple?(num, @multiples)}.reduce(:+)
  end

  def multiple?(number, multiple_of)
    multiple_of.any? { |multiple| number % multiple == 0 }
  end
end
