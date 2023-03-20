class AddUserIdToGymPlans < ActiveRecord::Migration[7.0]
  def change
    add_column :gym_plans, :user_id, :integer
    add_index :gym_plans, :user_id
  end
end
