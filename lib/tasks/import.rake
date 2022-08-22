# frozen_string_literal: true

require 'csv'

namespace :import do
  data_dir = Rails.root.join 'lib/tasks/data/'

  desc 'csvファイルから店舗データをインポートする e.g. rails import:branches'
  task branches: :environment do
    branch_file = data_dir.join 'branch_master.csv'
    list = []
    CSV.foreach(branch_file, headers: true) do |row|
      company = Company.find_or_create_by(name: row['企業名'], ieul_company_id: row['ieul_企業id'])
      prefec = Prefecture.find_by(name: row['都道府県'])
      city = prefec.cities.find_by(name: row['市区町村'])

      list << {
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
    end

    Branch.create!(list)
  end

  desc 'csvファイルから都道府県・市区町村データをインポートする e.g. rails import:address'
  task address: :environment do
    prefec_file = data_dir.join 'prefectures_master.csv'
    CSV.foreach(prefec_file, headers: true) do |row|
      Prefecture.find_or_create_by(id: row['id'], name: row['name'])
    end

    city_file = data_dir.join 'cities_master.csv'
    CSV.foreach(city_file, headers: true) do |row|
      prefec = Prefecture.find_by(id: row['prefecture_id'])
      prefec.cities.find_or_create_by(id: row['id'], name: row['name'])
    end
  end
end
