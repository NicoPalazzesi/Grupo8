class AgregarColumnaUsuarioAPublication < ActiveRecord::Migration[5.0]
  def change
  	add_column :publications, :user_id, :integer
  end
end
