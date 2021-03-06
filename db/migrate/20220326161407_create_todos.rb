# frozen_string_literal: true

# create todo table
class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :schedule, null: false

      t.timestamps
    end
  end
end
