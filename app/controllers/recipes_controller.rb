# frozen_string_literal: true

class RecipesController < ApplicationController
  def search
    @results = Recipes.search(search_params['search'])
  end

  private

  def search_params
    params.require(:search)
  end
end
