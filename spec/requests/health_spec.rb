# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Health endpoint', type: :request do
  describe 'GET /health' do
    it 'should return OK' do
      get '/health'
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq({ 'status' => 'OK' })
    end
  end
end
