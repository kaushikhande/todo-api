# frozen_string_literal: true

module Api
  module V1
    # todos index, create, update and destroy
    class TodosController < Api::V1::BaseController
      def index
        @todos = Todo.all
        render json: @todos
      end

      def create
        @todo = Todo.new(todo_params)

        if @todo.save
          render json: @todo
        else
          render json: @todo.errors.full_messages, status: :unprocessable_entity
        end
      end

      def update; end

      def destroy; end

      private

      def todo_params
        params.require(:todo).permit(:title, :description, :schedule)
      end
    end
  end
end
