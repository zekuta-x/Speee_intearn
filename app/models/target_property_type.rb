# frozen_string_literal: true

class TargetPropertyType < ApplicationRecord
  belongs_to :store
  belongs_to :property_type
end
