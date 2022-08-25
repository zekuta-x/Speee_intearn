# frozen_string_literal: true

class AssessmentsController < ApplicationController
  def new
    @branch_id = params[:branch_id]
  end

  def create; end
end
