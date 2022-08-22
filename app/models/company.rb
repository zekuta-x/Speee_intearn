# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :branches, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
  validates :ieul_company_id, presence: true, uniqueness: true
end
