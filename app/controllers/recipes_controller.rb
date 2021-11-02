# frozen_string_literal: true

class RecipesController < ApplicationController
  def search
    @results = search_params.key?('search') ? Recipe.search(search_params['search']) : []
  end

  private

  def search_params
    params.permit(:search)
  end
end
