# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it { expect(build(:recipe, name: nil)).not_to be_valid }
    it { expect(build(:recipe, ingredients: nil)).not_to be_valid }
  end

  describe '#search' do
    let!(:first_tomato_recipe) { create(:recipe, name: 'ABC', ingredients: ['tomates coupées']) }
    let!(:second_tomato_recipe) { create(:recipe, name: 'DEF', ingredients: ['tomates pelée']) }

    context 'when using with_pg_search_rank' do
      it 'order results by name' do
        expect(described_class.search('tomates').with_pg_search_rank.first).to eq(first_tomato_recipe)
      end
    end

    context 'when searching for tomates and pommes' do
      it 'returns 2 results' do
        expect(described_class.search('tomates pommes')).to contain_exactly(first_tomato_recipe, second_tomato_recipe)
      end
    end

    context "when searching for 'tomates'" do
      it 'returns 2 results' do
        expect(described_class.search('tomates')).to contain_exactly(first_tomato_recipe, second_tomato_recipe)
      end
    end

    context "when searching for 'pelées'" do
      it 'returns second_tomato_recipe' do
        expect(described_class.search('pelées')).to eq([second_tomato_recipe])
      end
    end
  end
end
