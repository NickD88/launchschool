#Write a program that iterates over an array and builds a new array that is the result of incrementing each value in the original array by a value of 2. You should have two arrays at the end of this program, The original array and the new array you've created. Print both arrays to the screen using the p method instead of puts.

array = [2, 4, 5, 9, 12]
array_2 = []

array.each do |x|
  array_2.push(x + 2)
end
p array
p array_2


#using .map method
arr = [2, 4, 5, 9, 12]
arr_2 = arr.map { |a| a + 2}

p arr
p arr_2
