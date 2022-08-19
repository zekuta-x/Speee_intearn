# frozen_string_literal: true

class BranchPropertyType < ApplicationRecord
  belongs_to :branch
  belongs_to :property_type
end
