class Store < ApplicationRecord
  belongs_to :company
  belongs_to :municipality
  has_many :assessable_areas
  has_many :target_property_types
end
