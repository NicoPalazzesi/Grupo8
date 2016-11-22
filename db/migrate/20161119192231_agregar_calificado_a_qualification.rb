class AgregarCalificadoAQualification < ActiveRecord::Migration[5.0]
  def change
  	add_column :qualifications, :calificado, :boolean, default: false
  end
end
