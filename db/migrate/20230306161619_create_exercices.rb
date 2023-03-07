class CreateExercices < ActiveRecord::Migration[7.0]
  def change
    create_table :exercices do |t|
      t.string :title
      t.text :details
      t.text :instructions
      t.integer :exp
      t.text :testing_code
      t.text :solution

      t.timestamps
    end
  end
end
