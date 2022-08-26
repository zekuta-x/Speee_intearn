class AssessmentForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :property_prefecture, :integer
  attribute :property_city, :integer
  attribute :property_other_address, :string
  attribute :property_type, :integer
  attribute :property_exclusive_area, :integer
  attribute :property_land_area, :integer
  attribute :property_building_area, :integer
  attribute :property_building_area_unit, :integer
  attribute :property_floor_area, :integer
  attribute :property_room_plan, :integer
  attribute :property_constructed_year, :integer
  attribute :user_email, :string
  attribute :user_first_name, :string
  attribute :user_last_name, :string
  attribute :user_first_name_kana, :string
  attribute :user_last_name_kana, :string
  attribute :user_tel, :string

  VALID_NUMBER_REGEX = /\A0\d{1,4}-\d{1,4}-\d{3,4}\z/

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
  validates :user_email, format: { with: URI::MailTo::EMAIL_REGEXP}, length: { maximum: 100 }, presence: true
  validates :user_first_name, length: { maximum: 15}, presence: true
  validates :user_last_name, length: { maximum: 15}, presence: true
  validates :user_first_name_kana, length: { maximum: 31}, presence: true
  validates :user_last_name_kana, length: {maximum: 31}, presence: true
  validates :user_tel, format: { with: VALID_NUMBER_REGEX }, presence: true
