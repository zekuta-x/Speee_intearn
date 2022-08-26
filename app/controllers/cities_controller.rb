class CitiesController < ApplicationController
  def show
     @cities = Branch.find(params[:id])
  end
end
