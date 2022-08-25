class AssessmentForm
    include ActiveModel::Model
    include ActiveModel::Attributes



    VALID_NUMBER_REGEX = /\A0\d{1,4}-\d{1,4}-\d{3,4}\z/

    validates :user_name, presence: true
    validates :user_name_kana, presence: true
    validates :user_tel, format: { with: VALID_NUMBER_REGEX }, presence: true
    validates :user_email, length: { maximum: 100 }, presence: true
    validates :property_address_prefectures, presence: true
    validates :property_address_cities, presence: true
    validates :property_other_address, presence: true
    validates :property_type, presence: true
    validates :property_exclusive_area, presence: true
    validates :property_land_area, presence: true
    validates :property_building_area_float, presence: true
    validates :property_building_area_unit, presence: true
    validates :property_floor_area, presence:true
    validates :property_room_plan, presence:true
    validates :property_constructed_year, presence: true
