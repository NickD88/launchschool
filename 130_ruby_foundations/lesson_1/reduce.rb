
def reduce (input, starting_number=0)
  counter = 0
  accumulator = starting_number
  while counter < input.length
    accumulator = yield(accumulator, input[counter])
    counter += 1
  end
  accumulator
end


array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
