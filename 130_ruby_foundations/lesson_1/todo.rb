require 'pry'

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(todo_item)
    raise TypeError, "Can only add Todo objects" unless todo_item.class == Todo
    @todos << todo_item
  end
   alias_method :add, :<<

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    puts "--- #{title} ---"
    @todos.map(&:to_s).join("\n")
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    returned = TodoList.new(title)
    each do |todo|
      returned << todo if yield(todo)
    end
    returned
  end

  def find_by_title(a_title)
    select { |todo| todo.title == a_title}.first
  end

  def all_done
    select {|todo| todo.done?}
  end

  def all_not_done
    select { |todo| !todo.done?}
  end

  def mark_done(a_title)
    find_by_title(a_title) && find_by_title(a_title).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

puts list

puts "all done"
puts list.all_done

puts "not done"
puts list.all_not_done

list.mark_all_undone
puts "all undone"
puts list

list.mark_all_done
puts "all done"
puts list

puts "find by title - Buy Milk"
puts list.find_by_title("Buy milk")

list.mark_all_undone

list.mark_done("Go to gym")

puts list
