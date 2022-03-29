# frozen_string_literal: true

module Api
  module V1
    # todos index, create, update and destroy
    class TodosController < Api::V1::BaseController
      def index
        @todos = Todo.all
        render json: @todos
      end

      def create; end

      def update; end

      def destroy; end
    end
  end
end
