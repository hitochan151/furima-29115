FactoryBot.define do
  factory :item do
    name                 { "商品" }
    description          { "good" }
    category_id          { 1 }
    product_status_id    { 1 }
    prefecture_id        { 1 }
    days_id              { 1 }
    selling_price        { 1 }
    shopping_charges_id  { 1 }


      association :user
      association :purchaser

      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
    
  end
end
