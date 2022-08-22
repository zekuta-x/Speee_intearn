# frozen_string_literal: true

class Branch < ApplicationRecord
  belongs_to :company
  belongs_to :city
  has_many :assessable_areas, dependent: :restrict_with_error
  has_many :branch_property_types, dependent: :restrict_with_error

  validates :name, presence: true
  validates :ieul_branch_id, presence: true, uniqueness: true
  validates :logo_url, presence: true
  validates :other_address, presence: true
  validates :catch_copy, presence: true
  validates :introduction, presence: true
  VALID_POST_CODE_REGEX = /[0-9]{3}-[0-9]{4}/
  validates :post_code, format: { with: VALID_POST_CODE_REGEX }
  VALID_NUMBER_REGEX = /^0\d{1,4}-\d{1,4}-\d{3,4}$/
  validates :phone_number, format: { with: VALID_NUMBER_REGEX }
  validates :fax_number, format: { with: VALID_NUMBER_REGEX }
end
