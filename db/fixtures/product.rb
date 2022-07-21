Product.delete_all
30.times do
  name        = Faker::Device.model_name
  description = Faker::Lorem.paragraph_by_chars
  price       = rand(15..20) * 1000000 + rand(1..99) * 10000
  category_id = rand 1..5
  residual    = rand 50..99
  sold        = rand 10..30
  Product.create!(
    name:        name,
    price:       price,
    image:       nil,
    residual:    residual,
    sold:        sold,
    description: description,
    category_id: category_id,
    created_at:  Time.zone.now)
end
