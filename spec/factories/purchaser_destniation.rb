FactoryBot.define do
  factory :purchaser_destniation do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '渋谷1-1' }
    building_name { '東京ハイツ' }
    phone_number { 12345678 }
  end
end