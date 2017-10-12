class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :mealtime
      t.string :desc
      t.integer :preptime
      t.integer :cooktime
      t.text :directions
      t.text :notes
      t.string :source
      t.string :holiday

      t.timestamps null: false
    end
  end
end
