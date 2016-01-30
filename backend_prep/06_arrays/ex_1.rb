#Write a program that checks to see if the number appears in the array.

arr = [1, 3, 4, 5, 9, 11]

def num_appears(tst_array, num)
  if tst_array.include?(num)
    puts "Yes, the array inlcudes #{num}"
  else
    puts "No, the array does not include #{num}"
  end
end

num_appears(arr, 3)
num_appears(arr, 22)
num_appears(arr, 1)
num_appears(arr, 8)
