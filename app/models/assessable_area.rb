# frozen_string_literal: true

class AssessableArea < ApplicationRecord
  belongs_to :branch
  belongs_to :city
end
