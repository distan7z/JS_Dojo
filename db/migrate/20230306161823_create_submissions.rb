class CreateSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :submissions do |t|
      t.integer :attempts_count, default: 0
      t.boolean :validation
      t.references :user, null: false, foreign_key: true
      t.references :exercice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
