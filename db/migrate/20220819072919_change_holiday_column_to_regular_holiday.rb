class ChangeHolidayColumnToRegularHoliday < ActiveRecord::Migration[7.0]
  def change
    rename_column :branchs, :holiday, :regular_holiday
  end
end
