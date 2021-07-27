FactoryBot.define do
  factory :item do
    title               { 'テストだよ' }
    text                { 'テストです' }
    category_id         { '2' }
    product_status_id   { '2' }
    shipping_charges_id { '2' }
    shipping_area_id    { '2' }
    days_to_ship_id     { '2' }
    price               { '1000' }

    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
