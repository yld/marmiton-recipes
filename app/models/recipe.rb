# frozen_string_literal: true

class Recipe < ApplicationRecord
  include PgSearch::Model

  validates :name, presence: true, uniqueness: true
  validates :ingredients, presence: true

  pg_search_scope(
    :search,
    against: :ingredient_ts_vector,
    ignoring: :accents,
    using: {
      tsearch: {
        dictionary: 'french',
        tsvector_column: 'ingredient_ts_vector'
      }
    }
  )
end
