Category.delete_all
5.times do |n|
  name = ["iPhone", "iPad", "AirPods", "Macbook", "Apple Watch" ]
  Category.create!(
    name:       name[n],
    created_at: Time.zone.now)
end
