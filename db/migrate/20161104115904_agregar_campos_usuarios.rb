class AgregarCamposUsuarios < ActiveRecord::Migration[5.0]
  def change
  	add_column :nombre,:apellido:string;:telefono:integer;
  end
end
