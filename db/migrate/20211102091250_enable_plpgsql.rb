class EnablePlpgsql < ActiveRecord::Migration[6.1]
  def change
    enable_extension "plpgsql"
  end
end
