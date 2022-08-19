class ChangeMunicipalitiesToCities < ActiveRecord::Migration[7.0]
  def change
    rename_table :municipalities, :cities
  end
end
