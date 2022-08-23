# frozen_string_literal: true

module AssessmentsHelper
  def room_plans
    { '1R(ワンルーム)': 1, '1K/1DK': 2, '2K/2DK': 3,
      '2LK/2LDK': 4, '3K/3DK': 5, '3LK/3LDK': 6,
      '4K/4DK': 7, '5K/5DK': 8, '5LK/5LDK': 9,
      '6K/6DK': 10, '6LK/6LDK以上': 11 }
  end

  def type
    { '分譲マンション': 1, '一戸建て': 2, '土地': 3 }
  end

  def area_unit
    { '平方メートル': 1, '坪': 2 }
  end
end
