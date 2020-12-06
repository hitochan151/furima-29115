FactoryBot.define do
  factory :item do
      content {Faker::Lorem.sentence}
      association :user
      association :purchaser
    
  end
end
