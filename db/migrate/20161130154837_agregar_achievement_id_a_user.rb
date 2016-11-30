class AgregarAchievementIdAUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :achievement_id, :integer
  end
end
