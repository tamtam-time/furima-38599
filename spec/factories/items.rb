FactoryBot.define do
  factory :item do
    association :user

    item_name { Faker::Name.name }
    explain { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 10) }
    status_id { Faker::Number.between(from: 1, to: 6) }
    postage_id { Faker::Number.between(from: 1, to: 2) }
    area_id { Faker::Number.between(from: 1, to: 47) }
    send_day_id { Faker::Number.between(from: 1, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
