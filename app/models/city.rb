# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :prefecture
  has_many :assessable_areas, dependent: :restrict_with_error
  has_many :assessable_branches, through: :assessable_areas, source: :branch
  has_many :branches, dependent: :restrict_with_error
  has_many :reviews, dependent: :restrict_with_error

  validates :name, presence: true

  def name_with_prefecture
    return prefecture.name if name.blank?

    "#{prefecture.name}#{name}"
  end
end
