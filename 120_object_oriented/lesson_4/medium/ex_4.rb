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

saying = Hello.new
saying.hi

saying1 = Goodbye.new
saying1.bye
