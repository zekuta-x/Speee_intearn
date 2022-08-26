# frozen_string_literal: true

class AssessmentsController < ApplicationController
  def new
    @branch_id = params[:branch_id]
    @assessment_form = AssessmentForm.new
  end

  def show; end

  def create
    @assessment_form = AssessmentForm.new(temp_param)
    @assessment_form.url_param = request.host
    if @assessment_form.save
      response = @assessment_form.post_api
      if response.status == 200
        redirect_to '/assessments/1', notice: t('.ok')
      end
    else
      redirect_to '/assessments/new', notice: t('.error')
    end

    post_api
  end

  private


  def temp_param 
      params.permit(:branch_id, :property_prefecture, :property_city, :property_other_address, :property_type, :property_exclusive_area, :property_land_area, :property_building_area, :property_building_area_unit, :property_floor_area, :property_room_plan, :property_constructed_year, :user_email, :user_first_name, :user_last_name, :user_first_name_kana, :user_last_name_kana, :user_tel)
  end
end
