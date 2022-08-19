class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.string :name, null: false
      t.references :company, null: false, foreign_key: true
      t.integer :ieul_branch_id, null: false
      t.string :logo_url, null: false
      t.string :post_code
      t.references :city, null: false, foreign_key: true
      t.string :other_address, null: false
      t.string :phone_number
      t.string :fax_number
      t.string :open_hours
      t.string :regular_holiday
      t.text :catch_copy, null: false
      t.text :introduction, null: false

      t.timestamps
    end
    add_index :branches, :ieul_branch_id, unique: true
  end
end
