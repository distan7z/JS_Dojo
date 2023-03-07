class AddUserCodeToSubmissions < ActiveRecord::Migration[7.0]
  def change
    add_column :submissions, :user_code, :string
  end
end
