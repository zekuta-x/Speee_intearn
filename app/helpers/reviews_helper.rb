# frozen_string_literal: true

module ReviewsHelper
  def formatted(date)
    date.strftime('%Y年%m月')
  end

  def formatted_with_unit(value)
    number_to_currency(value/(10**4).round, locale: 'ja')
  end
end
