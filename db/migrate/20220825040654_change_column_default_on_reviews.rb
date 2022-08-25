class ChangeColumnDefaultOnReviews < ActiveRecord::Migration[7.0]
  def change
    change_column_default :reviews, :reason_for_sale, from: 0, to: 1
    change_column_default :reviews, :contract_category, from: 0, to: 1
  end
end
