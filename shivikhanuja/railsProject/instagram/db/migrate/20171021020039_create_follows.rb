class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.references :user_id,foreign_key: { to_table: :users }
      t.integer :follower_id

      t.timestamps
    end
  end
end
