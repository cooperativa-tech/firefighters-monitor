class ChangeUsersEmailToUsername < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :email, :username
  end
end
