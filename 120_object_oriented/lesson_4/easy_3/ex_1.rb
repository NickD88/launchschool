class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
hello.hi    # prints "Hello"

hello = Hello.new
hello.bye   # undefined method error, no bye method in Hello or Greeting

hello = Hello.new
hello.greet # error, would need to pass argument into greet.  greet("hi")


hello = Hello.new
hello.greet("Goodbye") # prints "Goodbye"

Hello.hi    # error, no class method hi in Hello.  Would need self.hi method.
