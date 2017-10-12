class RemoveUsedInFromIngredientLists < ActiveRecord::Migration
  def change
    remove_reference :ingredient_lists, :used_in, index: true, foreign_key: true
  end
end
