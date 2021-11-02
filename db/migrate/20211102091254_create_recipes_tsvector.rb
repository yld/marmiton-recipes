class CreateRecipesTsvector < ActiveRecord::Migration[6.1]
  def change
    # rubocop:disable Rails/SquishedSQLHeredocs
    execute <<-SQL
      CREATE function upsert_recipe_tsvector() RETURNS trigger as $$
      BEGIN
        NEW.ingredient_ts_vector := to_tsvector('simple'::regconfig, array_to_string(NEW.ingredients, ''));
        RETURN NEW;
      END
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER upsert_recipe_tsvector_trig BEFORE INSERT OR UPDATE ON recipes FOR EACH ROW EXECUTE FUNCTION upsert_recipe_tsvector();
    SQL
    # rubocop:enable Rails/SquishedSQLHeredocs
  end
end
