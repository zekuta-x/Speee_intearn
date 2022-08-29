# frozen_string_literal: true

class BranchesController < ApplicationController
  def show
    @branch = Branch.find(params[:id])
    @reviews = if params[:latest]
                 @branch.reviews.latest
               elsif params[:best]
                 @branch.reviews.best
               else
                 @branch.reviews
               end
  end
end
