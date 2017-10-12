class CreateBloggs < ActiveRecord::Migration
  def change
    create_table :bloggs do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
