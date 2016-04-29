class Triangle
  def initialize(num_rows)
    @num_rows = num_rows
  end

  def rows
    triangle = [[1]]
    (@num_rows - 1).times do
      triangle << create_row(triangle.last)
    end
    triangle
  end

  def create_row(array)
    row = ([0] + array).zip(array + [0])
    row.collect { |num1, num2| num1 + num2 }
  end
end
