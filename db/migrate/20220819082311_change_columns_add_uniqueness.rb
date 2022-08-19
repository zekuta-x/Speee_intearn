class ChangeColumnsAddUniqueness < ActiveRecord::Migration[7.0]
  def change
    add_index :prefectures, :name, unique: true
    add_index :companies, [:name, :ieul_company_id], unique: true
    add_index :property_types, :name, unique: true
    add_index :branchs, :ieul_branch_id, unique: true
  end
end
