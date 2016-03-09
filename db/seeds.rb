# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
vendors_list_file = Rails.root.join('db', 'vendors_list.yml')
vendors_list = YAML::load_file(vendors_list_file)
Vendor.create(vendors_list)

users_list_file = Rails.root.join('db', 'users_list.yml')
users_list = YAML::load_file(users_list_file)
users_list.each do |u|
  user = User.new(u)
  user.skip_confirmation!
  user.save!
end

shoppers = Vendor.find_by(name: 'Shoppers Masaki')
food_lovers = Vendor.find_by(name: 'Food Lovers Market')
garden_market = Vendor.find_by(name: 'Garden Market')

mark = User.find_by(name: 'Mark Lovesfuit')
alex = User.find_by(name: 'Alex Eatsbroc')

Post.create(item: "Broccoli", vendor_id: shoppers.id, user_id: mark.id)
Post.create(item: "Apples", vendor_id: shoppers.id, user_id: alex.id)
Post.create(item: "Carrots", vendor_id: food_lovers.id, user_id: mark.id)
Post.create(item: "Durian", vendor_id: garden_market.id, user_id: alex.id)
Post.create(item: "Broccoli", vendor_id: shoppers.id, user_id: mark.id)
Post.create(item: "Apples", vendor_id: shoppers.id, user_id: alex.id)
Post.create(item: "Carrots", vendor_id: food_lovers.id, user_id: mark.id)
Post.create(item: "Durian", vendor_id: garden_market.id, user_id: alex.id)
Post.create(item: "Broccoli", vendor_id: shoppers.id, user_id: mark.id)
Post.create(item: "Apples", vendor_id: shoppers.id, user_id: alex.id)
Post.create(item: "Carrots", vendor_id: food_lovers.id, user_id: mark.id)
Post.create(item: "Durian", vendor_id: garden_market.id, user_id: alex.id)
Post.create(item: "Broccoli", vendor_id: shoppers.id, user_id: mark.id)
Post.create(item: "Apples", vendor_id: shoppers.id, user_id: alex.id)
Post.create(item: "Carrots", vendor_id: food_lovers.id, user_id: mark.id)
Post.create(item: "Durian", vendor_id: garden_market.id, user_id: alex.id)
Post.create(item: "Broccoli", vendor_id: shoppers.id, user_id: mark.id)
Post.create(item: "Apples", vendor_id: shoppers.id, user_id: alex.id)
Post.create(item: "Carrots", vendor_id: food_lovers.id, user_id: mark.id)
Post.create(item: "Durian", vendor_id: garden_market.id, user_id: alex.id)
Post.create(item: "Broccoli", vendor_id: shoppers.id, user_id: mark.id)
Post.create(item: "Apples", vendor_id: shoppers.id, user_id: alex.id)
Post.create(item: "Carrots", vendor_id: food_lovers.id, user_id: mark.id)
Post.create(item: "Durian", vendor_id: garden_market.id, user_id: alex.id)