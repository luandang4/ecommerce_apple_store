User.delete_all
password = "123123"
User.create!(
  email:                 "luan@gmail.com",
  name:                  "Luan Dang",
  phone:                 "0389456666",
  gender:                true,
  role:                  1,
  avatar:                "varun.jpg",
  is_active:             true,
  password:              password,
  password_confirmation: password,
  created_at:            Time.zone.now
)

20.times do |n|
  User.create!(
    email:                 Faker::Internet.email,
    name:                  Faker::Name.name,
    phone:                 ["+84","0"].sample + ["3","5","7","8","9"].sample + '%08d' % rand(8 ** 8),
    gender:                Faker::Gender.binary_type.downcase,
    role:                  0,
    avatar:                "varun.jpg",
    is_active:             true,
    password:              password,
    password_confirmation: password,
    created_at:            Time.zone.now
  )
end
