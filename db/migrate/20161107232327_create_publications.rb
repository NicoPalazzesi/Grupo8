class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.string :titulo
      t.string :descripcion
      t.string :ciudad
      t.string :foto

      t.timestamps
    end
  end
end
