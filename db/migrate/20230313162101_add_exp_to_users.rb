class AddExpToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :exp, :integer, default: 0
  end
end
