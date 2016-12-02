class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :descripcion
      t.integer :comment_id

      t.timestamps
    end
  end
end
