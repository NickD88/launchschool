#What will the following programs return? What is value of arr after each?

=begin
1. arr = ["b", "a"]
   arr = arr.product(Array(1..3))
   arr.first.delete(arr.first.last)

2. arr = ["b", "a"]
   arr = arr.product([Array(1..3)])
   arr.first.delete(arr.first.last)
=end


#1. arr =
    [["b", 1], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]
# the second part deletes the last item in the array at index 0 and returns 1
    [["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]

#2. arr =
    [["b", [1, 2, 3]], ["a", [1, 2, 3]]]
# the second part will delete the 1, 2, 3 from the "b" array at index 0 and returns [1, 2, 3]
    [["b"], ["a", [1, 2, 3]]]
