class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :number_of_series
      t.integer :number_of_reps

      t.timestamps
    end
  end
end
