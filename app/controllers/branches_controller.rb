# frozen_string_literal: true

class BranchesController < ApplicationController
  def show
    @branch = Branch.find(params[:id])
    if params[:latest]
      @reviews = @branch.reviews.latest
    elsif params[:best]
      @reviews = @branch.reviews.best
    else
      @reviews = @branch.reviews
    end
  end
end
