# frozen_string_literal: true

module ReviewsHelper
  def formatted(date)
    date.strftime('%Y年%m月')
  end
end
