
h1 = { a: 250, b: 300, c: 350 }
h2 = { e: 500, b: 750, c: 900 }

#create a hash with merge method

p h1.merge(h2) { |k, oldval, newval| newval - oldval}
puts h1
puts h2

#this method creats a new hash and does not alter the original hashes

#create a hash with merge! method

p h1.merge!(h2) { |k, oldval, newval| newval + oldval}
puts h1
puts h2

#this method adds the contents of h2 to h1 and stors it in h1
