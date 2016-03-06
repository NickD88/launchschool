# What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

# Modules are similar to classes, however you cannot create a new object with a module.  Modules must be mixed in to a class using the keyword include.  Once you mixin a module to a class, all of the modules funcationality is availale to that class and its objects. It is also used for namespaceing

module Type
  def brew_type(style)
    puts "#{style}"
  end
end

class BrewsAvailable
  include Type
end

homebrew = BrewsAvailable.new
homebrew.brew_type("I.P.A")
