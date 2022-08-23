class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.references :branch, null: false, foreign_key: true
      t.integer :age, null: false
      t.references :city, null: false, foreign_key: true
      t.string :property_address, null: false
      t.integer :response_satisfaction, null: false, default:0
      t.integer :sale_number, null: false, default:0
      t.integer :sale_reason, null: false, default:0
      t.references :property_type, null: false, foreign_key: true
      t.date :sale_consideration_period, null: false
      t.date :assessment_request_period, null: false
      t.date :sale_period, null: false
      t.date :sale_time, null: false
      t.date :delivery_time, null: false
      t.integer :appraisal_price, null: false
      t.integer :sold_price, null: false
      t.integer :contract_price, null: false
      t.boolean :price_reduction_flag, null: false
      t.integer :price_reduction_time
      t.integer :price_reduction
      t.integer :form, null: false, default:0
      t.string :heading, null: false
      t.text :sale_concerns, null: false
      t.text :company_selection_reason, null: false
      t.text :reasons_response_satisfaction, null: false
      t.text :advice, null: false
      t.text :improvement

      t.timestamps
    end
  end
end
