class AddRecipeToIngredientLists < ActiveRecord::Migration
  def change
    add_reference :ingredient_lists, :recipe, index: true, foreign_key: true
  end
end
