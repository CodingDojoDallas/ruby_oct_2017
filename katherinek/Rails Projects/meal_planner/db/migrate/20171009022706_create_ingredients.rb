class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :qty
      t.string :unit
      t.string :source
      t.string :state

      t.timestamps null: false
    end
  end
end
