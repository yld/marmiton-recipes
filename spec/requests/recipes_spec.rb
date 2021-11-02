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
    let(:first_tomato_recipe) { create(:recipe, ingredients: ['tomate coupées']) }
    let(:second_tomato_recipe) { create(:recipe, ingredients: ['tomate pelée']) }

    context 'when searching for tomates' do
      it 'returns 2 results' do
        get '/recipes/search.json?search=tomates'
        binding.pry
        expect(parsed_response.size).to eq(2)
      end
    end
  end
end
