# frozen_string_literal: true

require 'csv'

# rubocop:disable Metrics/BlockLength
namespace :import do
  data_dir = Rails.root.join 'lib/tasks/data/'

  desc 'csvファイルから店舗データをインポートする e.g. rails import:branches'
  task branches: :environment do
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
        branch = Branch.find_or_create_by!(branch_attrs)

        row['査定依頼可能エリア'].split(',').each do |id|
          branch.assessable_cities << City.find(id)
        end
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
      city_csv_path = data_dir.join 'cities_master.csv'
      CSV.foreach(city_csv_path, headers: true) do |row|
        prefecture = Prefecture.find_by(id: row['prefecture_id'])
        prefecture.cities.find_or_create_by!(id: row['id'], name: row['name'])
      end
    end
  end

  desc 'csvファイルから口コミデータをインポートする e.g. rails import:reviews'
  task reviews: :environment do
    review_csv_path = data_dir.join 'reviews_master.csv'

    ActiveRecord::Base.transaction do
      CSV.foreach(review_csv_path, headers: true) do |row|
        last_name, first_name = row['名前'].split
        sex = Review.sexes_i18n.invert[row['性別']].to_sym
        number_of_sale = Review.number_of_sales_i18n.invert[row['売却回数']].to_sym
        branch = Branch.find_by(ieul_branch_id: row['ieul_店舗id'])
        prefecture = Prefecture.find_by(name: row['都道府県'])
        city = prefecture.cities.find_by(name: row['市区町村'])
        property_type = PropertyType.find_or_create_by!(name: row['物件種別'])

        review_attrs = {
          last_name:,
          first_name:,
          branch:,
          sex:,
          age: row['年齢'],
          city:,
          other_address: row['住所全部'],
          customer_satisfaction: row['不動産会社の対応満足度'],
          number_of_sale:,
          reason_for_sale: row['売却理由'].to_i,
          property_type:,
          sale_consideration_date: row['売却検討時期'].to_date,
          assessment_request_date: row['査定依頼時期'].to_date,
          sale_date: row['売出時期'].to_date,
          sold_out_date: row['売却時期'].to_date,
          delivery_date: row['引渡時期'].to_date,
          appraisal_price: row['査定価格'],
          sale_price: row['販売価格'],
          contract_price: row['成約価格'],
          price_reduction_date: row['売り出してから何ヶ月後に値下げしたか'],
          price_reduction: row['値下げ価格'],
          contract_category: row['媒介契約の形態'].to_i,
          review_title: row['見出し'],
          concern_about_sale: row['売却時に不安だったこと'],
          reason_for_company_selection: row['この会社に決めた理由'],
          reason_for_customer_satisfaction: row['不動産会社の対応満足度の理由'],
          advice_on_sale: row['今後売却する人へのアドバイス'],
          improvement_to_company: row['不動産会社に改善してほしい点']
        }
        Review.find_or_create_by!(review_attrs)
      end
    end
  end

  desc 'csvファイルから物件種別データをインポートする e.g. rails import:property_types'
  task property_types: :environment do
    property_types_csv_path = data_dir.join 'property_types_master.csv'

    ActiveRecord::Base.transaction do
      CSV.foreach(property_types_csv_path, headers: true) do |row|
        PropertyType.find_or_create_by!(name: row['name'])
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
