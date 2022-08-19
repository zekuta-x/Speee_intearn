# frozen_string_literal: true

class Branch < ApplicationRecord
  belongs_to :company
  belongs_to :city
  has_many :assessable_areas, dependent: :restrict_with_error
  has_many :branch_property_types, dependent: :restrict_with_error
end
