class CreateOfrecimientos < ActiveRecord::Migration[5.0]
  def change
    create_table :ofrecimientos do |t|
      t.datetime :fecha
      t.string :descripcion
      t.boolean :aceptado
      t.integer :user_id
      t.integer :publication_id

      t.timestamps
    end
  end
end
