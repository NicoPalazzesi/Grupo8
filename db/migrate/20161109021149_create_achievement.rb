class CreateAchievement < ActiveRecord::Migration[5.0]
  def change
    create_table :achievements do |t|
      t.string :nombre
      t.integer :rangoMin
      t.integer :rangoMax

      t.timestamps
    end
  end
end
