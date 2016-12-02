class AgregarUserIdABuy < ActiveRecord::Migration[5.0]
  def change
  	add_column :buys, :user_id, :integer
  end
end
