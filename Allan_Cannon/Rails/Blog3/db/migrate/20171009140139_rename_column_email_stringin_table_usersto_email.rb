class RenameColumnEmailStringinTableUserstoEmail < ActiveRecord::Migration
  def change
    rename_column :users, :email_string, :email
  end
end
