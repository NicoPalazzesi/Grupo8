class CreateQualifications < ActiveRecord::Migration[5.0]
  def change
    create_table :qualifications do |t|
      t.boolean :calificacion
      t.string :descripcion

      t.timestamps
    end
  end
end
