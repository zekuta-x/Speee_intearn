# frozen_string_literal: true

class Company < ApplicationRecord
  valiadtes :name, presence: true, uniqueness: true
  valiadtes :ieul_company_id, presence: true, uniqueness: true
end
