class RenameColumnEmailStringinTableUsertoEmail < ActiveRecord::Migration
  def change
    rename_column :User, :email_string, :email
  end
end
