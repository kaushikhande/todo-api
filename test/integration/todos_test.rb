# frozen_string_literal: true

require 'test_helper'

class TodosTest < ActionDispatch::IntegrationTest
  include ResponseHelper

  def test_todos_data
    todo = todos(:one)
    get '/api/v1/todos'
    assert_response :success

    assert_equal todo.id, json_response(response:).first['id']
  end

  def test_create_todo
    assert_difference 'Todo.count', 1 do
      post '/api/v1/todos', params: {
        todo: {
          title: 'title',
          description: 'description',
          schedule: Time.current
        }
      }
    end
    assert_response :success
  end

  def test_create_todo_for_invalid_inputs
    assert_difference 'Todo.count', 0 do
      post '/api/v1/todos', params: {
        todo: {
          description: 'description'
        }
      }
    end
    assert_response :unprocessable_entity
  end
end
