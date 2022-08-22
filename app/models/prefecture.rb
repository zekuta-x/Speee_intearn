# frozen_string_literal: true

class Prefecture < ApplicationRecord
  valiadtes :name, presence: true
end
