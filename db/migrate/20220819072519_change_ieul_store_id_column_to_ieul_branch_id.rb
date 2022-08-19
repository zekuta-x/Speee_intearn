class ChangeIeulStoreIdColumnToIeulBranchId < ActiveRecord::Migration[7.0]
  def change
    rename_column :branchs, :ieul_store_id, :ieul_branch_id
  end
end
