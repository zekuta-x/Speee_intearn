class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.references :company, null: false, foreign_key: true
      t.integer :ieul_store_id
      t.string :logo_url
      t.string :post_code
      t.references :municipality, null: false, foreign_key: true
      t.string :property_address
      t.string :phone_number
      t.string :fax_number
      t.string :open_hours
      t.string :holiday
      t.text :catch_copy
      t.text :introduction

      t.timestamps
    end
  end
end
