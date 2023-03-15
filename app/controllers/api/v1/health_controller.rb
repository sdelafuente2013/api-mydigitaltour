# frozen_string_literal: true

module Api
  module V1
    class HealthController < ApplicationController
      def show
        render json: { status: 'OK status' }
      end
    end
  end
end
