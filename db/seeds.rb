10.times do |n|
  User.create! full_name: Faker::Internet.user_name,
    username: Faker::Internet.user_name,
    email: Faker::Internet.free_email,
    password: "123456",
    password_confirmation: "123456",
    role: 0,
    activated: 1
end

20.times do |n|
  Address.create! alias: "my address"+n.to_s,
    full_name: Faker::Name.name,
    post_code: Faker::Address.postcode,
    city: Faker::Address.city,
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number,
    user_id: rand(1..10)
end

Shipping.create! title: "My shipping",
  description: "",
  price: 15
Shipping.create! title: "UPS",
  description: "",
  price: 20

10.times do |n|
  Brand.create! name: Faker::Space.planet,
  description: Faker::Lorem.sentence
end

10.times do |n|
  Category.create! name: Faker::Space.moon
end

10000.times do |n|
  price_default = Faker::Number.decimal(3)
  Product.create name: Faker::LeagueOfLegends.champion,
    old_price: Faker::Number.decimal(3),
    price: Faker::Number.decimal(3),
    discount: 5,
    quantity: Faker::Number.number(2),
    short_description: Faker::Lorem.sentence,
    long_description: Faker::Lorem.paragraph,
    brand_id: rand(1..9),
    category_id: rand(1..9)
end

Payment.create! name: "COD", description: ""
Payment.create! name: "paypal", description: ""

10.times do |n|
  Order.create! transaction_id: SecureRandom.hex,
    user_id: rand(1..10),
    total: 100+n,
    status: rand(0..2),
    shipping_id: rand(1..2),
    payment_id: rand(1..2),
    address_id: rand(1..20)
end

10.times do |n|
  OrderDetail.create! product_id: rand(1..10),
    order_id: rand(1..10),
    quantity: rand(1..5),
    total_price: 1500
end

2.times do |n|
  Slide.create title: "slider"+(n+1).to_s,
    image: "slider-"+(n+1).to_s,
    link: "link"
end

10.times do |n|
  Comment.create product_id: n,
    user_id: n,
    content: Faker::Lorem.sentence,
    author: Faker::LeagueOfLegends.champion,
    email: Faker::Internet.free_email
end
