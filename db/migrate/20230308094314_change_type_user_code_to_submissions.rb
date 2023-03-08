class ChangeTypeUserCodeToSubmissions < ActiveRecord::Migration[7.0]
  def change
    change_column :submissions, :user_code, :text
  end
end
