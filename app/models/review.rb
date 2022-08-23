# frozen_string_literal: true

class Review < ApplicationRecord
  enum number_of_sales: { first: 0, second: 1, after_the_third_time: 2 }, _prefix: true
  enum reason_for_sale: { resettlement: 0, inheritance: 1, changing_job: 2, divorce: 3, asset_liquidation: 4,
                      financial_reasons: 5, other: 6 }
  enum brokerage_contract: { exclusive_duty: 0, fulltime_mediation: 1, general_mediation: 2, unknown: 3 }

  belongs_to :branch
  belongs_to :city
  belongs_to :property_type

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :age, presence: true
  validates :other_address, presence: true
  validates :response_satisfaction, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :number_of_sales, presence: true
  validates :reason_for_sale, presence: true
  validates :sale_consideration_period, presence: true
  validates :assessment_request_period, presence: true
  validates :sale_period, presence: true
  validates :sold_out_period, presence: true
  validates :delivery_period, presence: true
  validates :appraisal_price, presence: true
  validates :sold_price, presence: true
  validates :contract_price, presence: true
  validates :price_reduction_flag, presence: true
  validates :contract_category, presence: true
  validates :review_title, presence: true
  validates :concerns_about_the_sale, presence: true
  validates :reason_for_company_selection, presence: true
  validates :reason_for_response_satisfaction, presence: true
  validates :advice_on_Selling, presence: true
end
