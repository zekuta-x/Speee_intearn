# frozen_string_literal: true

class Municipality < ApplicationRecord
  belongs_to :prefecture
  has_many :assessable_areas
end
