x = 0

while x <= 10
  if x.odd?
    puts  x
  end
  x += 1
end

y = 0

while y <= 10
  if y == 3
    y +=1
    next
  elsif y.odd?
    puts y
  end
  y +=1
end

z = 0

while z <= 10
  if z == 7
    break
  elsif z.odd?
    puts z
  end
  z += 1
end
