# frozen_string_literal: true

class RecipesController < ApplicationController
  def search
    @results = search_params.key?('search') ? Recipe.search(search_params['search']).with_pg_search_rank.page(1) : []
  end

  private

  def search_params
    params.permit(:search)
  end
end
