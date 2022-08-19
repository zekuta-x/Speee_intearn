# frozen_string_literal: true

class PropertyType < ApplicationRecord
  has_many :target_property_types
end
