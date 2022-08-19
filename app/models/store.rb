# frozen_string_literal: true

class Store < ApplicationRecord
  belongs_to :company
  belongs_to :municipality
  has_many :assessable_areas, dependent: :restrict_with_error
  has_many :target_property_types, dependent: :restrict_with_error
end
