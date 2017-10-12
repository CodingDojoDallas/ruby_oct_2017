class AddIngredientToIngredientLists < ActiveRecord::Migration
  def change
    add_reference :ingredient_lists, :ingredient, index: true, foreign_key: true
  end
end
