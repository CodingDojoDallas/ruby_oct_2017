class CreateIngredientLists < ActiveRecord::Migration
  def change
    create_table :ingredient_lists do |t|
      t.references :calls_for, index: true, foreign_key: true
      t.references :used_in, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
