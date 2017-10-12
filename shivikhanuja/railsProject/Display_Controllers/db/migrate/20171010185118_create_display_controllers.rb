class CreateDisplayControllers < ActiveRecord::Migration
  def change
    create_table :display_controllers do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
