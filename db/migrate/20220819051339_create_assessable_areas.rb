class CreateAssessableAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :assessable_areas do |t|
      t.references :company, foreign_key: true
      t.references :municipality, foreign_key: true

      t.timestamps
    end
  end
end
