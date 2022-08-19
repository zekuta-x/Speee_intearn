# frozen_string_literal: true

class AssessableArea < ApplicationRecord
  belongs_to :store
  belongs_to :city
end
