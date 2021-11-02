# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  let(:parsed_response) { JSON.parse(response.body) }

  describe 'GET /search without search data' do
    it 'returns http success' do
      get '/recipes/search.json'
      expect(response).to have_http_status(:success)
    end

    it 'returns an empty array' do
      get '/recipes/search.json'
      expect(parsed_response).to be_empty
    end
  end

  describe 'GET /search with search data' do
    before do
      create(:recipe, ingredients: ['tomate coupées'])
      create(:recipe, ingredients: ['tomate pelée'])
    end

    context 'when searching for tomates' do
      it 'returns 2 results' do
        get '/recipes/search.json?search=tomates'
        expect(parsed_response.size).to eq(2)
      end
    end

    context 'when searching for muscade' do
      it 'returns 2 results' do
        get '/recipes/search.json?search=muscade'
        expect(parsed_response.size).to eq(0)
      end
    end
  end
end
