# frozen_string_literal: true

class AssessmentForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :branch_id, :integer
  attribute :property_prefecture, :string
  attribute :property_city, :string
  attribute :property_other_address, :string
  attribute :property_type, :integer, default: 1
  attribute :property_exclusive_area, :integer
  attribute :property_land_area, :integer
  attribute :property_building_area, :integer
  attribute :property_building_area_unit, :integer, default: 1
  attribute :property_floor_area, :integer
  attribute :property_room_plan, :integer, default: 1
  attribute :property_constructed_year, :integer
  attribute :url_param, :string
  attribute :user_email, :string
  attribute :user_first_name, :string
  attribute :user_last_name, :string
  attribute :user_first_name_kana, :string
  attribute :user_last_name_kana, :string
  attribute :user_tel, :string

  VALID_NUMBER_REGEX = /\A0\d{1,4}-\d{1,4}-\d{3,4}\z/

  validates :branch_id, presence: true
  validates :property_prefecture, presence: true
  validates :property_city, presence: true
  validates :property_other_address, presence: true
  validates :property_type, presence: true
  validates :property_exclusive_area, presence: true
  validates :property_land_area, presence: true
  validates :property_building_area, presence: true
  validates :property_building_area_unit, presence: true
  validates :property_floor_area, presence: true
  validates :property_room_plan, presence: true
  validates :property_constructed_year, presence: true
  validates :url_param, presence: true
  validates :user_email, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { maximum: 100 }, presence: true
  validates :user_first_name, length: { maximum: 15 }, presence: true
  validates :user_last_name, length: { maximum: 15 }, presence: true
  validates :user_first_name_kana, length: { maximum: 31 }, presence: true
  validates :user_last_name_kana, length: { maximum: 31 }, presence: true
  validates :user_tel, format: { with: VALID_NUMBER_REGEX }, presence: true

  def address_search
    prefecture = Prefecture.find_by(name: property_prefecture)
    @property_city = prefecture.cities.find_by(name: property_city)
    @property_address = @property_city.name_with_prefecture + property_other_address
  end

  def name_join
    "#{user_last_name} #{user_first_name}"
  end

  def name_kana_join
    "#{user_last_name_kana} #{user_first_name_kana}"
  end

  def post_api_params # rubocop:disable Metrics/MethodLength
    {
      'branch_id' => branch_id,
      'property_city' => @property_city.id,
      'property_address' => @property_address,
      'property_type' => property_type,
      'property_exclusive_area' => property_exclusive_area,
      'property_land_area' => property_land_area,
      'property_building_area' => property_building_area,
      'property_building_area_unit' => property_building_area_unit,
      'property_floor_area' => property_floor_area,
      'url_param' => url_param,
      'property_room_plan' => property_room_plan,
      'property_constructed_year' => property_constructed_year,
      'user_email' => user_email,
      'user_name' => name_join,
      'user_name_kana' => name_kana_join,
      'user_tel' => user_tel
    }
  end

  def post_api
    return unless valid?

    address_search
    conn = Faraday.new(
      url: ENV.fetch('API_URI', nil), params: post_api_params, ssl: { verify: false }
    )
    conn.post ENV.fetch('BODY', nil)
  end
end
