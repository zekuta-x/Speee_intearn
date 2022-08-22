# frozen_string_literal: true

class Prefecture < ApplicationRecord
  has_many :cities, dependent: :restrict_with_error

  validates :name, presence: true
end
