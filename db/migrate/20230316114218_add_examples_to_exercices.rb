class AddExamplesToExercices < ActiveRecord::Migration[7.0]
  def change
    add_column :exercices, :examples, :string
  end
end
