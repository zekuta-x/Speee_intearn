# frozen_string_literal: true

class Review < ApplicationRecord
  enum response_satisfaction: { '1': 0, '2': 1, '3': 2, '4': 3, '5': 4 }, _prefix: true
  enum sale_number: { first: 0, second: 1, third: 2 }, _prefix: true
  enum sale_reason: { resettlement: 0, inheritance: 1, changing_job: 2, divorce: 3, asset_liquidation: 4,
                      financial_reasons: 5, other: 6 }
  enum form: { exclusive_duty: 0, fulltime_mediation: 1, general_mediation: 2, unknown: 3 }

  belongs_to :branch
  belongs_to :city
  belongs_to :property_type

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :age, presence: true
  validates :property_address, presence: true
  validates :response_satisfaction, presence: true
  validates :sale_number, presence: true
  validates :sale_reason, presence: true
  validates :sale_consideration_period, presence: true
  validates :assessment_request_period, presence: true
  validates :sale_period, presence: true
  validates :sale_time, presence: true
  validates :delivery_time, presence: true
  validates :appraisal_price, presence: true
  validates :sold_price, presence: true
  validates :contract_price, presence: true
  validates :price_reduction_flag, presence: true
  validates :form, presence: true
  validates :heading, presence: true
  validates :sale_concerns, presence: true
  validates :sale_concerns, presence: true
  validates :company_selection_reason, presence: true
  validates :reasons_response_satisfaction, presence: true
  validates :advice, presence: true
end
