# frozen_string_literal: true

class BranchesController < ApplicationController
  def show
    @branch = Branch.find(params[:id])
    @review = Review.where(branch: @branch.id)
  end
end
