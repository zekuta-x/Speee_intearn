# frozen_string_literal: true

class BranchesController < ApplicationController
  def show
    @branch = Branch.find(params[:id])
    @reviews = ordered_reviews
  end

  private

  def ordered_reviews # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    if params[:sold_out_date_desc]
      @branch.reviews.order(sold_out_date: :desc)
    elsif params[:sold_out_date_asc]
      @branch.reviews.order(sold_out_date: :asc)
    elsif params[:satisfaction_desc]
      @branch.reviews.order(customer_satisfaction: :desc)
    elsif params[:satisfaction_asc]
      @branch.reviews.order(customer_satisfaction: :asc)
    else
      @branch.reviews
    end
  end
end
