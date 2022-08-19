class CreateMunicipalities < ActiveRecord::Migration[7.0]
  def change
    create_table :municipalities do |t|
      t.string :name
      t.references :prefecture, null: false, foreign_key: true

      t.timestamps
    end
  end
end
