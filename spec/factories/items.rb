FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    introduction           { Faker::Lorem.sentence }
    price                  { Faker::Number.between(from: 1, to: 9_999_999) }
    item_condition_id      { 3 }
    preparation_day_id     { 2 }
    postage_payer_id       { 3 }
    category_id            { 6 }
    trading_status_id      { 6 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
