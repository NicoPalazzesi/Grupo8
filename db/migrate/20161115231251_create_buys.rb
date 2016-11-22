class CreateBuys < ActiveRecord::Migration[5.0]
  def change
    create_table :buys do |t|

      t.bigint :tarjeta
      t.integer :puntos

      t.timestamps
    end
  end
end
