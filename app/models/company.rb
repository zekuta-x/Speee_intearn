# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :ieul_company_id, presence: true, uniqueness: true
end
