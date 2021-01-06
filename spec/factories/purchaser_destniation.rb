FactoryBot.define do
  factory :purchaser_destniation do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '渋谷1-1' }
    building_name { '東京ハイツ' }
    phone_number { "8012345678" }
    token {"tok_abcdefghijk00000000000000000"}
    user_id {1}
    item_id {1}
  end
end