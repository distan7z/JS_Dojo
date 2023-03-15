class AddFunctionNameToExercices < ActiveRecord::Migration[7.0]
  def change
    add_column :exercices, :function_name, :string
  end
end
