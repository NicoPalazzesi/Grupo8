class AgregarNoNullableAQualifications < ActiveRecord::Migration[5.0]
  def change
  	change_column :qualifications, :calificacion, :boolean, null: false
  end
end
