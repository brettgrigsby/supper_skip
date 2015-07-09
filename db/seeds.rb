Restaurant.create!([
  {name: "Endangered Eats", description: "Get em before they're gone!", slug: "e-eats", user_id: 1},
  {name: "Jorge's Sandwiches", description: "We start with bread, and then add meat!", slug: "js-sandwiches", user_id: 2},
  {name: "G'norath's Tavern", description: "Our steaks have +2 against hunger!", slug: "rollin-twenties", user_id: 2}
])

Category.create!([
  {name: "Appetizers", restaurant_id: 1},
  {name: "Lunch", restaurant_id: 1},
  {name: "Dinner", restaurant_id: 1},
  {name: "Dessert", restaurant_id: 2},
  {name: "Bugs", restaurant_id: 2},
  {name: "Birds", restaurant_id: 2},
  {name: "Cute", restaurant_id: 3},
  {name: "Local", restaurant_id: 3},
  {name: "Gluten Free", restaurant_id: 3}
])

Item.create!([
  {title: "Koala Kebabs", description: "Marinated in Austrailian Aoili, with Bokchoy, Red Pepper, & Pineapple.", price: 2700, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://ipad.wallpaperswiki.com/wp-content/uploads/2012/10/Koala-Bear-Portrait.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Garlic Herb Bald Eagle", description: "Served on a bed of Arugula & Roasted Vegetables", price: 177600, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://2.bp.blogspot.com/-ZeWjNkJJBtY/UF9h5OP7ESI/AAAAAAAABFE/57cHP6l4Lsw/s1600/eagle%202.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Octokitty & Chips", description: "Freshwater Octokitty, served with Tartar sauce", price: 133700, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://turpial.org.ve/wp-content/uploads/2012/02/octocat.png', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Blue Whale Steak", description: "Served blue unless specified, served with Garlic Fries", price: 1200, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://3.bp.blogspot.com/-LRTwydLLTNs/UHFgm__b9HI/AAAAAAAAEdw/w05ewNaVxKc/s1600/Blue+Whale+Jumping+Out+of+Water.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Wooly Mammoth Burger", description: "Med-Rare Burger with Swiss, Carmelized Onions, and Bacon on a Brioche Bun", price: 2000, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://1.bp.blogspot.com/-cxUY8vzkBlM/T2AencCFGyI/AAAAAAAABaQ/JOl8xq_eqvI/s1600/wooly_mammoth_model.JPG', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Seal Veal Picatta", description: "Capers, Arugula, Parsley, & a Red-Wine Reduction",  price: 1400, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://1.bp.blogspot.com/_Npmtn5-O8Uo/S7U86hI3kUI/AAAAAAAAABk/LL59lOfRrcQ/s1600/foca_arpa-1024x768-87398.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Giant Panda Skillet", description: "Stir-Fried with Bok Choy, Peppers, Peas and Carrots over Jasmine Rice", price: 8000, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://ipad.wallpaperswiki.com/wp-content/uploads/2012/10/Panda-Climbing.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Capybara Stew", description: "Slow cooked with Potatoes, Parsnips, & Beets. Comes with a side of fresh-baked French Baguette", price: 3300, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://ipad.wallpaperswiki.com/wp-content/uploads/2012/10/Capybara-4.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Sloth Ribs", description: "Slow-cooked and oh so tender, with Ghost Pepper Fries and a Garlic Aoili", price: 3200, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://2.bp.blogspot.com/-DAoY8Y2eBhM/TrEgjbGEgUI/AAAAAAAAAJ0/y8eC_3x2JT4/s400/sloth.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Whooping Crane Sandwich", description: "Grilled & Seasoned Crane with Provolone, Arugula, & Red Pepper Hummus", price: 300, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://arvamont.com/photojournal/aransas/IMG_8409.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Braised Canada Lynx Steak", description: "Served with Chanterelles, Parsley & Chèvre ", price: 600, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://www.traveltop.net/wallpapers/2012/05/canadian-lynx-british-columbia-canada-2048x2048.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Humpback Chub Sandwich", description: "Salsa Verde & Potato Salad on a Sourdough Bun", price: 2400, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://pubs.usgs.gov/fs/2007/3113/images/coverphoto.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Marinated Preble's Meadow Jumping Mouse", description: "Served on a bed of Greens, Lemon & Olive oil", price: 700, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://upload.wikimedia.org/wikipedia/commons/2/2c/Apodemus_sylvaticus_(Sardinia).jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Mexican Spotted Owl Tacos", description: "Street-Style Tacos served with fresh Pico de Gallo & Cabbage Slaw", price: 2000, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://upload.wikimedia.org/wikipedia/commons/e/ef/Barred_owl.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Grilled Colorado Pikeminnow Salad", description: "Summer Corn Succotash, Cherry Tomatoes & Basil Pistou on a bed of Spinach", price: 1500, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://previewcf.turbosquid.com/Preview/2014/05/27__03_28_28/Colorado1.jpg9c9785f3-d60c-4011-bf3c-695a10e7a1f1Large.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Mountain Plover & Beet Salad", description: "Plover & Beets served with Arugula, Garlic, & Pinenuts", price: 1500, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://2.bp.blogspot.com/-tUrT1RJEQBI/TaydXLp2UOI/AAAAAAAAAVQ/GruwIo9OGTg/s1600/Mountain-Plover-5638a.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Fried Lesser Prarie Chicken Salad", description: "Summer Salad with Strawberries, Almonds, & Feta Cheese", price: 1500, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://media.npr.org/assets/img/2014/04/09/ap761500909427_sq-dcd3a992e54e05d8364743c5be54e6fded70c1bb.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Pawnee Skipper Filet", description: "Served with Jumbo Lump Crab, Asparagus, Baby Fingerlings, Gribiche", price: 2000, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://farm6.staticflickr.com/5512/11865452314_f7b1ca743c_o.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Golden-winged Warbler Breast", description: "Green Chile Grit Cake, Lacinato Kale, Piquillo Coulis & Green Curry Sauce", price: 1300, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://intrepidbirder.com/wp-content/uploads/2013/10/DSC_5489.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Olive-sided Flycatcher Quinoa Bowl", description: "Protien-packed Bowl with Spinach, Tomato, & Pesto", price: 1700, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://upload.wikimedia.org/wikipedia/commons/4/46/Empidonax-minimus-001.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Rocky Mountain Capshells", description: "Served with Plantain Hash, Green Beans, Edamame, Fried Capers, Pickled Red Onions & Lemon Habanero Tartar Sauce ", price: 1700, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://www.snail-world.com/wp-content/uploads/snail-front.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Grilled Greed Rusty Blackbird Bun", description: "Steamed Sesame Bun, Scallions & Miso-Pickled Cucumbers", price: 1700, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://www.birds-of-north-america.net/images/rusty-blackbird-13.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {title: "Uncompahgre Fritillary Butterfly", description: "Crispy Noodles, Lemongrass, Coconut Milk, Pea Shoots, & Cilantro", price: 1700, max_quantity: 500, scarcity: "endangered", image_file_name: 'http://www.naba.org/chapters/nabambc/species-data/Lycaena-phlaeas-photo-5.jpg', image_content_type: nil, image_file_size: nil, image_updated_at: nil}
])

Item.all.each do |item| 
  item.restaurant_id = (rand(3) + 1)
  item.save
end

Item.all.each do |item|
  item.categories << Category.where(restaurant_id: item.restaurant_id).sample
  item.save
end

Order.create!([
  {delivery: true, user_id: 1, aasm_state: "cancelled", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 2, aasm_state: "cancelled", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 5, aasm_state: "completed", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 4, aasm_state: "completed", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 6, aasm_state: "completed", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 7, aasm_state: "basket", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 8, aasm_state: "basket", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 3, aasm_state: "basket", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 6, aasm_state: "basket", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 7, aasm_state: "ordered", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 9, aasm_state: "ordered", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 10, aasm_state: "paid", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 11, aasm_state: "paid", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 12, aasm_state: "paid", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 3, aasm_state: "paid", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: nil, aasm_state: "basket", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 3, aasm_state: "basket", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 1, aasm_state: "basket", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 2, aasm_state: "ordered", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 4, aasm_state: "ordered", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 5, aasm_state: "ordered", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 4, aasm_state: "ordered", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 3, aasm_state: "basket", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 1, aasm_state: "basket", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 2, aasm_state: "ordered", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 4, aasm_state: "ordered", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 5, aasm_state: "ordered", ccn: nil, expdate: nil, card_name: nil},
  {delivery: true, user_id: 4, aasm_state: "ordered", ccn: nil, expdate: nil, card_name: nil}
])

Order.all.each do |order| 
  order.restaurant_id = (rand(3) + 1)
  order.save
end

Order.all.each do |order|
  item = Item.where(restaurant_id: order.restaurant_id).sample
  order.order_items.create!(item_id: item.id, quantity: (rand(2) + 1))
end


User.create!([
  {first_name: "Rachel", last_name: "Warbelow", email: "demo+rachel@jumpstartlab.com", username: nil, password: "password", role: "user"},
  {first_name: "Jorge", last_name: "Tellez", email: "demo+jorge@jumpstartlab.com", username: "novohispano", password: "password", role: "user"},
  {first_name: "Jon", last_name: "Snow", email: "jsnow@whitewall.gov", username: "theblack69", password: "password", role: "admin"},
  {first_name: "Josh", last_name: "Cheek", email: "demo+josh@jumpstartlab.com", username: "josh", password: "password", role: "admin"},
  {first_name: "jeff", last_name: "", email: "demo+jeff@jumpstartlab.com", username: nil, password: "password", role: nil},
  {first_name: "a", last_name: "b", email: "a@b.com", username: nil, password: "password", role: nil},
  {first_name: "c", last_name: "d", email: "c@d.com", username: nil, password: "password", role: nil},
  {first_name: "e", last_name: "f", email: "e@f.com", username: nil, password: "password", role: nil},
  {first_name: "a", last_name: "a", email: "abc@123.com", username: nil, password: "password", role: nil},
  {first_name: "name", last_name: "nammmmme", email: "abcd@123.com", username: nil, password: "password", role: nil},
  {first_name: "name", last_name: "name", email: "abcde@123.com", username: nil, password: "password", role: nil},
  {first_name: "Bald", last_name: "Eagle", email: "bald@eagle.com", username: nil, password: "password", role: nil}
])

