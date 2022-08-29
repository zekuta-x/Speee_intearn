# frozen_string_literal: true

module ReviewsHelper
  def formatted(date)
    date.strftime('%Y年%m月')
  end

  def formatted_with_unit(price)
    price_in_10thousands = (price / (10**4)).round # 下4桁を丸めて万単位に
    number_to_currency(price_in_10thousands, locale: 'ja')
  end
end
