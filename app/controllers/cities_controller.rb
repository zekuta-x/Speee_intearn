# frozen_string_literal: true

class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @branches_page = @city.assessable_branches.page(params[:page])
  end
end
