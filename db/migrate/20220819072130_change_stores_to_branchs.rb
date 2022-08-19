class ChangeStoresToBranchs < ActiveRecord::Migration[7.0]
  def change
    rename_table :stores, :branchs
  end
end
