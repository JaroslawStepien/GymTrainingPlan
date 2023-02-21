class CreateGymPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :gym_plans do |t|
      t.string :name
      t.integer :number_of_days

      t.timestamps
    end
  end
end
