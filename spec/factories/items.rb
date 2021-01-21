FactoryBot.define do
  factory :item do
    name                    { 'テスト商品名' }
    explanation             { 'テスト説明文' }
    category_id             { 2 }
    state_id                { 2 }
    delivery_price_id       { 2 }
    prefectures_id          { 2 }
    delivery_time_id        { 2 }
    price                   { 1500 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
