class AddCuisineToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :cuisine, :string
  end
end
