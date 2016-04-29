class Triangle
  def initialize(num_rows)
    @num_rows = num_rows
  end

  def rows
    return [[1]] if @num_rows == 1
    final_triangle = [[1]]
    current_row = [1]
    (@num_rows - 1).times do
      current_row = create_row(current_row)
      final_triangle << current_row
    end
    final_triangle
  end

  def create_row(array)
    row = ([0] + array).zip(array + [0])
    row.collect { |num1, num2| num1 + num2 }
  end
end
