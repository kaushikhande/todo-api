# frozen_string_literal: true

require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test 'validation error for title presence' do
    todo = Todo.create
    assert_not todo.valid?
    assert todo.errors.messages[:title]
  end

  test 'validation error for schedule presence' do
    todo = Todo.create(title: 'test')
    assert_not todo.valid?
    assert todo.errors.messages[:schedule]
  end

  test 'creates todo for valid attributes' do
    assert_difference 'Todo.count', 1 do
      Todo.create title: :test, schedule: Time.current
    end
  end

  test 'validation error for schedule greater than or equal today' do
    todo = Todo.create title: :test, schedule: DateTime.current - 1
    assert_not todo.valid?
    assert todo.errors.full_messages.first.match?(/schedule/i)
  end
end
