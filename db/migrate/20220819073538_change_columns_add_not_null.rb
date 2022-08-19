class ChangeColumnsAddNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :prefectures, :name, false
    change_column_null :cities, :name, false
    change_column_null :companies, :name, false
    change_column_null :companies, :ieul_company_id, false
    change_column_null :property_types, :name, false
    change_column_null :branchs, :name, false
    change_column_null :branchs, :ieul_branch_id, false
    change_column_null :branchs, :logo_url, false
    change_column_null :branchs, :property_address, false
    change_column_null :branchs, :catch_copy, false
    change_column_null :branchs, :introduction, false
  end
end
