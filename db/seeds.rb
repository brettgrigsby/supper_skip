user_role = Role.create!(title: "user")
admin_role = Role.create!(title: "admin")
cook_role = Role.create!(title: "cook")
delivery_role = Role.create!(title: "delivery")

User.create!([
  {first_name: "Rachel", last_name: "Warbelow", email: "demo+rachel@jumpstartlab.com", username: nil, password: "password"},
  {first_name: "Jorge", last_name: "Tellez", email: "demo+jorge@jumpstartlab.com", username: "novohispano", password: "password"},
  {first_name: "jeff", last_name: "", email: "demo+jeff@jumpstartlab.com", username: nil, password: "password"},
  {first_name: "user", last_name: "", email: "user@email.com", username: nil, password: "password"},
  {first_name: "user5", last_name: "", email: "user5@email.com", username: nil, password: "password"},
  {first_name: "user2", last_name: "", email: "user2@email.com", username: nil, password: "password"},
  {first_name: "user3", last_name: "", email: "user3@email.com", username: nil, password: "password"},
  {first_name: "user4", last_name: "", email: "user4@email.com", username: nil, password: "password"},
  {first_name: "admin", last_name: "", email: "admin@email.com", username: nil, password: "password"},
  {first_name: "Josh", last_name: "Cheek", email: "demo+josh@jumpstartlab.com", username: "josh", password: "password"}
])


User.all.each do |user| 
  user.roles << user_role
  user.roles << cook_role if user.id == 4
  user.roles << delivery_role if user.id == 5
  user.roles << admin_role if user.id > 6
end


admin_ids = admin_role.users.pluck(:id)

1.upto(10) do |v|
  Restaurant.create! ({ name: "Endangered Eats#{v}",
                        description: "insert whitty description here",
                        slug: "e-eats#{v}",
                        user_id: admin_ids.sample})
end

User.find(4).user_roles.last.update(restaurant_id: 1)
User.find(5).user_roles.last.update(restaurant_id: 1)

1.upto(30) do |v|
  Category.create! ({ name: "Category#{v}", restaurant_id: rand(1..10) })
end

1.upto(500) do |v|
  Item.create!({ title: "Grilled Greed Rusty Blackbird Bun#{v}",
                 description: "Steamed Sesame Bun, Scallions & Miso-Pickled Cucumbers",
                 price: rand(1..2000),
                 max_quantity: 500,
                 scarcity: "endangered",
                 image_file_name: 'http://www.birds-of-north-america.net/images/rusty-blackbird-13.jpg',
                 image_content_type: nil,
                 image_file_size: nil,
                 image_updated_at: nil,
                 restaurant_id: rand(1..Restaurant.all.size)})
end

Item.all.each do |item|
  item.categories << Category.where(restaurant_id: item.restaurant_id)
  item.save
end

  def all_order_states
    [:paid,
     :ready_for_prep,
     :in_preparation,
     :ready_for_delivery,
     :out_for_delivery,
     :delivered,
     :cancelled]
  end

1.upto(500) do |order|
  Order.create!({ delivery: true,
                  user_id: rand(1..User.all.size),
                  workflow_state: "#{all_order_states.sample}",
                  ccn: nil,
                  expdate: nil,
                  card_name: nil})
end

Order.all.each do |order|
  order.restaurant_id = (rand(1..Restaurant.all.size))
  order.save
end

Order.all.each do |order|
  item = Item.where(restaurant_id: order.restaurant_id).sample
  order.order_items.create!(item_id: item.id, quantity: (rand(1..2)))
end

