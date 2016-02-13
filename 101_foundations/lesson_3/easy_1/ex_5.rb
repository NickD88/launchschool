def is_between(start, finish, num)
puts ("Is #{num} between #{start} and #{finish}")
  p (start..finish).cover?(num)
end

is_between(10, 100, 42)
