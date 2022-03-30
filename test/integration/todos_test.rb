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
    assert_no_difference 'Todo.count' do
      post '/api/v1/todos', params: {
        todo: {
          description: 'description'
        }
      }
    end
    assert_response :unprocessable_entity
  end

  def test_update_todo_for_valid_inputs
    todo = todos(:one)
    put "/api/v1/todos/#{todo.id}", params: {
      todo: {
        title: 'new title',
        description: 'description'
      }
    }
    assert_response :success
    assert_equal 'new title', todo.reload.title
  end

  def test_update_todo_for_invalid_inputs
    todo = todos(:one)
    put "/api/v1/todos/#{todo.id}", params: {
      todo: {
        title: nil,
        description: 'description'
      }
    }
    assert_response :unprocessable_entity
  end

  def test_destroy_todo
    todo = todos(:one)
    assert_difference 'Todo.count', -1 do
      delete "/api/v1/todos/#{todo.id}"
    end

    assert_response :no_content
  end
end
