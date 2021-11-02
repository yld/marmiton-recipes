# frozen_string_literal: true

json.array!(
  @results,
  :name,
  :ingredients,
  :image,
  :cook_time,
  :prep_time,
  :total_time,
  :author,
  :nb_comments,
  :people_quantity,
  :budget,
  :difficulty,
  :rate,
  :author_tip,
  :tags
)
