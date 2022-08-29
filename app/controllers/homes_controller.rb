# frozen_string_literal: true

class HomesController < ApplicationController
  def index
    @prefecture = Prefecture.all
  end
end
