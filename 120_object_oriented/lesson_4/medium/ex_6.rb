class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer1
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# There is no difference in the functionality of the two classes.  They both have
# access to the getter/setter methods.  Using the @ notation is better practice.
