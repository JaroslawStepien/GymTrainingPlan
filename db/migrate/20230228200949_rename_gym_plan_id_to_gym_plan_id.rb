class RenameGymPlanIdToGymPlanId < ActiveRecord::Migration[7.0]
  def change
    rename_column :exercises, :GymPlan_id, :gym_plan_id
  end
end
