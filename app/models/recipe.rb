# frozen_string_literal: true

class Recipe < ApplicationRecord
  paginates_per 50
  include PgSearch::Model

  validates :name, presence: true
  validates :ingredients, presence: true

  pg_search_scope(
    :search,
    against: :ingredient_ts_vector,
    order_within_rank: 'name ASC',
    ignoring: :accents,
    using: {
      tsearch: {
        prefix: true,
        any_word: true,
        dictionary: :french,
        tsvector_column: 'ingredient_ts_vector'
      }
    }
  )
end
