class AddAmountToIngredientLists < ActiveRecord::Migration
  def change
    add_column :ingredient_lists, :amount, :integer
  end
end
