class CambiarFechaUsuarios < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :fecha, :date
  end
end
