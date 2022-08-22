# frozen_string_literal: true

class PropertyType < ApplicationRecord
  has_many :branch_property_types, dependent: :restrict_with_error

  valiadtes :name, presence: true, uniqueness: true
end
