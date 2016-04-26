
def select(array)
  counter = 0
  returned_array = []
  while counter < array.size
    current_element = array[counter]
    returned_array << current_element if yield(current_element)
    counter += 1
  end

  returned_array
end


array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
