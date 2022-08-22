# frozen_string_literal: true

class Prefecture < ApplicationRecord
  validates :name, presence: true
end
