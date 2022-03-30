# frozen_string_literal: true

module Api
  module V1
    # todos index, create, update and destroy
    class TodosController < Api::V1::BaseController
      before_action :find_todo, only: %i[update destroy]

      def index
        @todos = Todo.all
        render json: @todos
      end

      def create
        @todo = Todo.new(todo_params)

        if @todo.save
          render json: @todo
        else
          render_error_messages
        end
      end

      def update
        if @todo.update(todo_params)
          render json: @todo
        else
          render_error_messages
        end
      end

      def destroy
        if @todo.destroy
          head :no_content
        else
          render_error_messages
        end
      end

      private

      def todo_params
        params.require(:todo).permit(:title, :description, :schedule)
      end

      def find_todo
        @todo = Todo.find(params[:id])
      end

      def render_error_messages
        render_error data: @todo.errors.full_messages
      end
    end
  end
end
