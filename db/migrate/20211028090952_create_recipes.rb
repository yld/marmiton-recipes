# frozen_string_literal: true

class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name, null: false, unique: true
      t.string :ingredients, null: false, array: true
      t.string :image, null: true
      t.string :cook_time
      t.string :prep_time
      t.string :total_time
      t.string :author
      t.integer :nb_comments
      t.integer :people_quantity
      t.string :budget
      t.string :difficulty
      t.integer :rate
      t.string :author_tip
      t.string :tags
      t.tsvector :ingredient_ts_vector
    end

    add_index :recipes, :name, unique: true
    add_index :recipes, :ingredient_ts_vector, using: :gin
  end
end
