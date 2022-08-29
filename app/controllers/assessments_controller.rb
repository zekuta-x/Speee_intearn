# frozen_string_literal: true

class AssessmentsController < ApplicationController
  def new
    @branch_id = params[:branch_id]
    @assessments_form = AssessmentForm.new
  end

  def show; end

  def create
    @assessments_form = AssessmentForm.new(temp_param)
    @branch_id = @assessments_form.branch_id
    @assessments_form.url_param = request.host
    if @assessments_form.post_api
      redirect_to '/assessments/1', notice: t('.ok')
    else
      pp @assessments_form.errors.full_messages
      render 'new', notice: t('.error'), status: :unprocessable_entity
    end
  end

  private

  def temp_param
    params.require(:assessment_form).permit(:branch_id, :property_prefecture, :property_city, :property_other_address, :property_type,
                  :property_exclusive_area, :property_land_area, :property_building_area, :property_building_area_unit, :property_floor_area, :property_room_plan, :property_constructed_year, :user_email, :user_first_name, :user_last_name, :user_first_name_kana, :user_last_name_kana, :user_tel)  # rubocop:disable Style/LineLength
  end
end
