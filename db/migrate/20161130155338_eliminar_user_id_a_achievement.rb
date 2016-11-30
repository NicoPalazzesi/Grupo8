class EliminarUserIdAAchievement < ActiveRecord::Migration[5.0]
  def change
 	remove_column :achievements, :user_id
  end
end
