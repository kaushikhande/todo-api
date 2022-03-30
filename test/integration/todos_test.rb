# frozen_string_literal: true

require 'test_helper'

class TodosTest < ActionDispatch::IntegrationTest
  include ResponseHelper

  def test_todos_data
    todo = todos(:one)
    get '/api/v1/todos'
    assert_equal 200, status

    assert_equal todo.id, json_response(response:).first['id']
  end
end
