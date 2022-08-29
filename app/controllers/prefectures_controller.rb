# frozen_string_literal: true

class PrefecturesController < ApplicationController
  def index
    @prefecture = Prefecture.all
  end
end
