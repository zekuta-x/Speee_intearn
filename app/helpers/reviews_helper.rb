# frozen_string_literal: true

module ReviewsHelper
  def formatted(date)
    date.strftime('%Y年%m月')
  end

  def formatted_with_unit(price)
    number_to_currency(price / (10**4).round, locale: 'ja')
  end
end
