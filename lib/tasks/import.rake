# frozen_string_literal: true

require 'csv'

namespace :import do # rubocop:disable Metrics/BlockLength
  data_dir = Rails.root.join 'lib/tasks/data/'

  desc 'csvファイルから店舗データをインポートする e.g. rails import:branches'
  task branches: :environment do  # rubocop:disable Metrics/BlockLength
    branch_csv_path = data_dir.join 'branch_master.csv'

    ActiveRecord::Base.transaction do
      CSV.foreach(branch_csv_path, headers: true) do |row|
        company = Company.find_or_create_by!(name: row['企業名'], ieul_company_id: row['ieul_企業id'])
        prefecture = Prefecture.find_by(name: row['都道府県'])
        city = prefecture.cities.find_by(name: row['市区町村'])

        branch_attrs = {
          name: row['店舗名'],
          company:,
          ieul_branch_id: row['ieul_店舗id'],
          logo_url: row['ロゴURL'],
          post_code: row['郵便番号'],
          city:,
          other_address: row['以降住所'],
          phone_number: row['電話番号'],
          fax_number: row['FAX番号'],
          open_hours: row['営業時間'],
          regular_holiday: row['定休日'],
          catch_copy: row['キャッチコピー'],
          introduction: row['紹介文']
        }
        Branch.create!(branch_attrs)
      end
    end
  end

  desc 'csvファイルから都道府県・市区町村データをインポートする e.g. rails import:address'
  task address: :environment do
    prefecture_csv_path = data_dir.join 'prefectures_master.csv'

    ActiveRecord::Base.transaction do
      CSV.foreach(prefecture_csv_path, headers: true) do |row|
        Prefecture.find_or_create_by!(id: row['id'], name: row['name'])
      end
    end

    ActiveRecord::Base.transaction do
      city_file = data_dir.join 'cities_master.csv'
      CSV.foreach(city_file, headers: true) do |row|
        prefec = Prefecture.find_by(id: row['prefecture_id'])
        prefec.cities.find_or_create_by!(id: row['id'], name: row['name'])
      end
    end
  end
end
