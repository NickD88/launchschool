# Question 8

def foo(param = "no")
  "yes"
end

#passing foo into bar will make param = 'yes'.  Yes is not equal to no therefor 'no' will be printed out
def bar(param = "no")
  param == "no" ? "yes" : "no"
end

puts"=> The below code will print out 'no'"
p bar(foo)
