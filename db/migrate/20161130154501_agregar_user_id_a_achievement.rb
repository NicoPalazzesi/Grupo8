class AgregarUserIdAAchievement < ActiveRecord::Migration[5.0]
  def change
 	add_column :achievements, :user_id, :integer
  end
end
