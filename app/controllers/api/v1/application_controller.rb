# frozen_string_literal: true

module Api
  module V1
    #
    # The API controller base.
    #
    class ApplicationController < ActionController::API
      rescue_from ActiveRecord::RecordNotFound do |e|
        render_error(:not_found, e.message)
      end

      rescue_from ActiveRecord::RecordNotUnique do |_|
        render_error(:conflict, "record already exists")
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render_error(:bad_request, e.message)
      end

      def render_error(status, message)
        render json: { message: message }, status: status
      end
    end
  end
end
