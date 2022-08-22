class CreateBranchPropertyTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :branch_property_types do |t|
      t.references :branch, foreign_key: true
      t.references :property_type, foreign_key: true

      t.timestamps
    end
  end
end
