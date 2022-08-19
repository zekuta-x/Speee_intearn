class CreatePropertyTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :property_types do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :property_types, :name, unique: true
  end
end
