class AgregarPuntosUsuarios < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :puntos, :integer, {:default=>"1"}
  end
end
