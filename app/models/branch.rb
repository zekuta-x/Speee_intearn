# frozen_string_literal: true

class Branch < ApplicationRecord
  belongs_to :company
  belongs_to :city
  has_many :assessable_areas, dependent: :restrict_with_error
  has_many :assessable_cities, through: :assessable_areas, source: :city
  has_many :branch_property_types, dependent: :restrict_with_error

  VALID_POST_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
  VALID_NUMBER_REGEX = /\A0\d{1,4}-\d{1,4}-\d{3,4}\z/

  validates :ieul_branch_id, presence: true
  validates :logo_url, presence: true
  validates :other_address, presence: true
  validates :catch_copy, presence: true
  validates :introduction, presence: true
  validates :post_code, format: { with: VALID_POST_CODE_REGEX }, allow_blank: true
  validates :phone_number, format: { with: VALID_NUMBER_REGEX }, allow_blank: true
  validates :fax_number, format: { with: VALID_NUMBER_REGEX }, allow_blank: true
end
