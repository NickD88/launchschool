#Write a method that counts down to zero using recursion.

def launch_countdown(num)
  if num <= 0
    print "Blast Off!"
  else
    print "#{num}.."
    launch_countdown(num -1)
  end
end

puts launch_countdown(5)
puts launch_countdown(10)
