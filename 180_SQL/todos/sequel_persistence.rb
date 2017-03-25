require "sequel"

DB = Sequel.connect("postgres://localhost/todos")

class SequelPersistence

  def initialize(logger)
    DB.logger = logger
  end

  def find_list(id)
    all_lists.first(lists__id: id)
  end

  def all_lists
    DB[:lists].left_join(:todo, list_id: :id).
      select_all(:lists).
      select_append do
        [ count(todo__id).as(todos_count),
          count(nullif(todo__completed, true)).as(todos_remaining_count) ]
      end.
      group(:lists__id).
      order(:lists__name)
  end

  def create_list(list_name)
    DB[:lists].insert(name: list_name)
  end

  def update_list_name(id, new_name)
    DB[:lists].where(id: id).update(name: new_name)
  end

  # todo table set to 'ON DELETE CASCADE'
  def delete_list(id)
    DB[:lists].where(id: id).delete
  end

  def create_todo(list_id, todo_name)
    DB[:todo].insert(name: todo_name, list_id: list_id)
  end

  def update_todo_status(list_id, todo_id, new_status)
    DB[:todo].where(id: todo_id, list_id: list_id).update(completed: new_status)
  end

  def complete_all_todos(list_id)
    DB[:todo].where(list_id: list_id).update(completed: true)
  end

  def delete_todo_from_list(todo_id, list_id)
    DB[:todo].where(id: todo_id, list_id: list_id).delete
  end

  def find_todos_for_list(list_id)
    DB[:todo].select(:id, :name, :completed).where(list_id: list_id)
  end
end