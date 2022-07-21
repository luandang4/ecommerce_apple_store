DeliveryAddress.delete_all
40.times do
  user_id = User.all.size != 0 ? rand(User.first.id.to_i..User.last.id.to_i) : rand(1..20)
  User.find(user_id).delivery_addresses.create!(
    name:       Faker::Name.name,
    phone:      ["+84","0"].sample + ["3","5","7","8","9"].sample + '%08d' % rand(8 ** 8),
    address:    Faker::Address.full_address,
    created_at: Time.zone.now
  )
end
