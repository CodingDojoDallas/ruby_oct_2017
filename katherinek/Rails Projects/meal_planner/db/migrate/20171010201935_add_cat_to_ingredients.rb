class AddCatToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :cat, :string
  end
end
