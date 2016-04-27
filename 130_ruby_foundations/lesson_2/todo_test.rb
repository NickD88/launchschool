require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require 'simplecov'
SimpleCov.start

require_relative 'todo'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_initialize_title
    assert_equal("Today's Todos", @list.title)
  end

  def test_todo_done
    @todo1.done!
    assert_equal(true, @todo1.done?)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    returned_todo = @list.shift
    assert_equal(@todo1, returned_todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    returned_todo = @list.pop
    assert_equal(@todo3, returned_todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_all_done
    assert_equal(false, @list.done?)
  end

  def test_add_raises_error
    assert_raises(TypeError) { @list.add(5) }
    assert_raises(TypeError) { @list.add('string')}
    assert_raises(TypeError) { @list.add(nil)}
  end

  def test_add_alias
    new_todo = Todo.new("Go to bed!")
    @list << new_todo
    todos = @todos << new_todo

    assert_equal(todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) {@list.item_at(4)}
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) {@list.mark_done_at(4)}
    @list.mark_done_at(1)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) {@list.mark_undone_at(4)}
    @list.mark_all_done
    @list.mark_undone_at(0)

    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done_bang
    @list.done!

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(33)}
    @list.remove_at(0)

    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    --- Today's Todos ---
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    --- Today's Todos ---
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    --- Today's Todos ---
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each_iterating
    all_items = []
    @list.each { |todo| all_items << todo }
    assert_equal([@todo1, @todo2, @todo3], all_items)
  end

  def test_each_return
    assert_equal(@list, @list.each { |todo| nil } )
  end

  def test_select
    @todo2.done!
    test_list = TodoList.new(@list.title)
    test_list.add(@todo2)

    assert_equal(test_list.title, @list.title)
    assert_equal(test_list, @list.select {|todo| todo.done?})
  end
end
