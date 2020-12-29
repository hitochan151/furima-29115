FactoryBot.define do
  factory :purchaser_destniation do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { 12345678 }
  end
end