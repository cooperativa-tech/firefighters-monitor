class AddSortIndexToUsers < ActiveRecord::Migration[6.0]
  FIXNUM_MAX = (2**(4 * 8 - 2) - 1).freeze

  def change
    add_column :users, :sort_index, :integer, default: FIXNUM_MAX
  end
end
