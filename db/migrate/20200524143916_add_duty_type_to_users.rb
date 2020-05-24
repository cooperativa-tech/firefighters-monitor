class AddDutyTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :duty_type, :string
  end
end
