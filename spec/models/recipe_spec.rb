# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let!(:first_tomato_recipe) { create(:recipe, ingredients: ['tomate coupées']) }
  let!(:second_tomato_recipe) { create(:recipe, ingredients: ['tomate pelée']) }

  context "when searching for 'tomates'" do
    it 'returns 2 results' do
      binding.pry
      expect(described_class.search('tomates').size).to eq(2)
    end
  end

  context "when searching for 'pelées'" do
    it 'returns 2 results' do
      expect(described_class.search('pelées').size).to eq(1)
    end
  end
end
