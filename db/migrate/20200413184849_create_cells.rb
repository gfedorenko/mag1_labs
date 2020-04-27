class CreateCells < ActiveRecord::Migration[5.0]
  def change
    create_table :cells do |t|
      t.references :field, foreign_key: true
      t.references :row, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
