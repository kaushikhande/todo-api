# frozen_string_literal: true

# Add done boolean column to todos table.
class AddDoneToTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :done, :boolean, default: false
  end
end
