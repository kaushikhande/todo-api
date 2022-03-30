# frozen_string_literal: true

module Api
  module V1
    # common api methods
    class BaseController < ActionController::API
      def render_error(data:, status: :unprocessable_entity)
        render json: data, status:
      end
    end
  end
end
