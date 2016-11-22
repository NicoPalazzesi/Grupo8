class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nombre, :string
  	add_column :users, :apellido, :string
  	add_column :users, :telefono, :integer
  	add_column :users, :fecha, :datetime
  	add_column :users, :admin, :boolean, default: false
  end
end
