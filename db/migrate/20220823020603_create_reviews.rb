class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.references :branch, null: false, foreign_key: true
      t.integer :age, null: false
      t.references :city, null: false, foreign_key: true
      t.string :other_address, null: false
      t.integer :customer_satisfaction, null: false
      t.integer :number_of_sale, null: false, default:0
      t.integer :reason_for_sale, null: false, default:0
      t.references :property_type, null: false, foreign_key: true
      t.date :sale_consideration_period, null: false
      t.date :assessment_request_period, null: false
      t.date :sale_period, null: false
      t.date :sold_out_period, null: false
      t.date :delivery_period, null: false
      t.integer :appraisal_price, null: false
      t.integer :sale_price, null: false
      t.integer :contract_price, null: false
      t.integer :price_reduction_time
      t.integer :price_reduction
      t.integer :contract_category, null: false, default:0
      t.string :review_title, null: false
      t.text :concern_about_sale, null: false
      t.text :reason_for_company_selection, null: false
      t.text :reason_for_customer_satisfaction, null: false
      t.text :advice_on_sale, null: false
      t.text :improvement_to_company

      t.timestamps
    end
  end
end
