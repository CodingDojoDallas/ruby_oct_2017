class RemoveCallsForFromIngredientLists < ActiveRecord::Migration
  def change
    remove_reference :ingredient_lists, :calls_for, index: true, foreign_key: true
  end
end
