# frozen_string_literal: true

class AssessmentsController < ApplicationController
  def new
    @branch_id = params[:branch_id]
    @assessment_form = AssessmentForm.new
  end

  def show; end

  def create
    @host = request.host
    property_prefecture = Prefecture.find_by(name: params.require(:property_address_prefectures))
    @property_city = property_prefecture.cities.find_by(name: params.require(:property_address_cities))
    @property_address = @property_city.name_with_prefecture + params.require(:property_other_address)

    post_api
  end

  private

  def assessment_params # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    {
      'branch_id' => params.require(:branch_id),
      'property_city' => @property_city.id,
      'property_address' => @property_address,
      'property_type' => params.require(:property_type),
      'property_exclusive_area' => params.require(:property_exclusive_area),
      'property_land_area' => params.require(:property_land_area),
      'property_building_area' => params.require(:property_building_area),
      'property_building_area_unit' => params.require(:property_building_area_unit),
      'property_floor_area' => params.require(:property_floor_area),
      'url_param' => @host,
      'property_room_plan' => params.require(:property_room_plan),
      'property_constructed_year' => params.require(:property_constructed_year),
      'user_email' => params.require(:user_email),
      'user_name' => params.require(:user_name),
      'user_name_kana' => params.require(:user_name_kana),
      'user_tel' => params.require(:user_tel)
    }
  end

  def post_api
    conn = Faraday.new(
      url: ENV.fetch('API_URI', nil), params: assessment_params, ssl: { verify: false }
    )

    response = conn.post ENV.fetch('BODY', nil)

    if response.status == 200
      redirect_to '/assessments/1', notice: t('.ok')
    else
      redirect_to '/assessments/1', notice: t('.error')
    end
  end
end
