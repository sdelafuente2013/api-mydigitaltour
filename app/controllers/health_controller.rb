class HealthController < ApplicationController
  def show
    render json: { status: 'OK' }
  end
end
