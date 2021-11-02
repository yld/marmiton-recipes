# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /search' do
    it 'returns http success' do
      get '/recipes/search'
      expect(response).to have_http_status(:success)
    end
  end
end
