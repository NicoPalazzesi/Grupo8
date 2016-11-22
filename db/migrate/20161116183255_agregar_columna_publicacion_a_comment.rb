class AgregarColumnaPublicacionAComment < ActiveRecord::Migration[5.0]
  def change
  	add_column :comments, :publication_id, :integer
  end
end
