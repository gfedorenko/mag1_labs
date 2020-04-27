class CreateFields < ActiveRecord::Migration[5.0]
  def change
    create_table :fields do |t|
      t.references :header, foreign_key: true
      t.string :name
      t.string :field_type

      t.timestamps
    end
  end
end
