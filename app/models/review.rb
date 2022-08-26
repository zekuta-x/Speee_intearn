# frozen_string_literal: true

class Review < ApplicationRecord
  enum sex: { male: 0, female: 1, others: 2 }
  enum number_of_sale: { first: 0, second: 1, others: 2 }, _prefix: true
  enum reason_for_sale: { changing_residence: 1, inheritance: 2, changing_job: 3, divorce: 4, asset_liquidation: 5,
                          financial_reasons: 6, others: 99 }, _prefix: true
  enum contract_category: { exclusive_duty: 1, fulltime_mediation: 2, general_mediation: 3, unknown: 4 }

  belongs_to :branch
  belongs_to :city
  belongs_to :property_type

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :sex, presence: true
  validates :age, presence: true
  validates :other_address, presence: true
  validates :customer_satisfaction, presence: true,
                                    numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :number_of_sale, presence: true
  validates :reason_for_sale, presence: true
  validates :sale_consideration_date, presence: true
  validates :assessment_request_date, presence: true
  validates :sale_date, presence: true
  validates :sold_out_date, presence: true
  validates :delivery_date, presence: true
  validates :appraisal_price, presence: true
  validates :sale_price, presence: true
  validates :contract_price, presence: true
  validates :contract_category, presence: true
  validates :review_title, presence: true
  validates :concern_about_sale, presence: true
  validates :reason_for_company_selection, presence: true
  validates :reason_for_customer_satisfaction, presence: true
  validates :advice_on_sale, presence: true

  def address
    "#{city.name_with_prefecture}#{other_address}"
  end
end
