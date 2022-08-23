class DeleteIeulBranchIdUniqueIndexFromBranches < ActiveRecord::Migration[7.0]
  def change
    remove_index :branches, :ieul_branch_id
  end
end
