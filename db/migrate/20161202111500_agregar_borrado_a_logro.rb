class AgregarBorradoALogro < ActiveRecord::Migration[5.0]
  def change
  	add_column :achievements, :borrado, :boolean, default: false
  end
end
