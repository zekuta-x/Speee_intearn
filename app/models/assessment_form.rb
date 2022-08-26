class AssessmentForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  extend Enumerize

  enumerize :property_room_plan, in:  { r1: 1, k1_dk1: 2, lk2_ldk2: 3, k2_dk2: 4,
    ld2_ldk2: 5, k3_dk3: 6, lk3_ldk3: 7,
    k4_dk4: 8, lk4_ldk4: 9, k5_dk5: 10, lk5_ldk5: 11,
    k6_dk6: 12, others: 13 }
  enumerize :property_building_area_unit, in: { m2: 1, tsubo: 2}
  enumerize :property_type, in: { condominium: 1, house: 2, land: 3 }

  attribute :branch_id, :integer
  attribute :property_prefecture, :string
  attribute :property_city, :string
  attribute :property_other_address, :string
  attribute :property_type, :integer
  attribute :property_exclusive_area, :integer
  attribute :property_land_area, :integer
  attribute :property_building_area, :integer
  attribute :property_building_area_unit, :integer
  attribute :property_floor_area, :integer
  attribute :property_room_plan, :integer
  attribute :property_constructed_year, :integer
  attribute :url_param, :string
  attribute :user_email, :string
  attribute :user_first_name, :string
  attribute :user_last_name, :string
  attribute :user_first_name_kana, :string
  attribute :user_last_name_kana, :string
  attribute :user_tel, :string

  VALID_NUMBER_REGEX = /\A0\d{1,4}-\d{1,4}-\d{3,4}\z/

  validates :branch_id, presence:true
  validates :property_prefecture, presence: true
  validates :property_city, presence: true
  validates :property_other_address, presence: true
  validates :property_type, presence: true
  validates :property_exclusive_area, presence: true
  validates :property_land_area, presence: true
  validates :property_building_area, presence: true
  validates :property_building_area_unit, presence: true
  validates :property_floor_area, presence:true
  validates :property_room_plan, presence:true
  validates :property_constructed_year, presence: true
  validates :url_param, presence: true
  validates :user_email, format: { with: URI::MailTo::EMAIL_REGEXP}, length: { maximum: 100 }, presence: true
  validates :user_first_name, length: { maximum: 15}, presence: true
  validates :user_last_name, length: { maximum: 15}, presence: true
  validates :user_first_name_kana, length: { maximum: 31}, presence: true
  validates :user_last_name_kana, length: {maximum: 31}, presence: true
  validates :user_tel, format: { with: VALID_NUMBER_REGEX }, presence: true
end
