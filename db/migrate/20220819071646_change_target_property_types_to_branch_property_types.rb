class ChangeTargetPropertyTypesToBranchPropertyTypes < ActiveRecord::Migration[7.0]
  def change
    rename_table :target_property_types, :branch_property_types
  end
end
