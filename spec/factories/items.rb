FactoryBot.define do
  factory :item do
    name                 { "商品" }
    description          { "good" }
    category_id          { 2 }
    product_status_id    { 2 }
    prefecture_id        { 2 }
    days_id              { 2 }
    selling_price        { 310 }
    shopping_charges_id  { 2 }


      association :user


      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
    
  end
end
