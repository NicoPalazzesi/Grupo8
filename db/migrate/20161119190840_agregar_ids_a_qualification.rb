class AgregarIdsAQualification < ActiveRecord::Migration[5.0]
  def change
  	add_column :qualifications, :user_id, :integer
  	add_column :qualifications, :publication_id, :integer
  end
end
