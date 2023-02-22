class AddGymPlanIdToExercises < ActiveRecord::Migration[7.0]
  def change
    add_column :exercises, :GymPlan_id, :integer
    add_index :exercises, :GymPlan_id
  end
end
