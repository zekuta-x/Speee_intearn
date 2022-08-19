class Municipality < ApplicationRecord
  belongs_to :prefecture
  has_many :assessable_areas
end
