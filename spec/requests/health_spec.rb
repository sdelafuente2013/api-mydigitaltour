# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Health endpoint', type: :request do
  describe 'GET /health' do
    it 'returns OK status' do
      get '/api/v1/health'

      expect(response).to be_successful
      expect(JSON.parse(response.body)).to eq('status' => 'OK status')
    end
  end
end
