class EliminarNullableQualifications < ActiveRecord::Migration[5.0]
  def change
  	change_column :qualifications, :calificacion, :boolean
  end
end
