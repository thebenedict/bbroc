# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

produce_list_file = Rails.root.join('db', 'produce_list.yml')
produce_list = YAML::load_file(produce_list_file)
produce_list.each { |item_name| Item.create(name: item_name) }

vendors_list_file = Rails.root.join('db', 'vendors_list.yml')
vendors_list = YAML::load_file(vendors_list_file)
Vendor.create(vendors_list)

users_list_file = Rails.root.join('db', 'users_list.yml')
users_list = YAML::load_file(users_list_file)
User.create(users_list)
User.all.each { |u| u.confirm! }

broccoli = Item.find_by(name: 'Broccoli')
apples = Item.find_by(name: 'Apples')
carrots = Item.find_by(name: 'Carrots')
durian = Item.find_by(name: 'Durian')

shoppers = Vendor.find_by(name: 'Shoppers Masaki')
food_lovers = Vendor.find_by(name: 'Food Lovers Market')
garden_market = Vendor.find_by(name: 'Garden Market')

mark = User.find_by(first_name: 'Mark')
alex = User.find_by(first_name: 'Alex')

Post.create(item_id: broccoli.id, vendor_id: shoppers.id, user_id: mark.id)
Post.create(item_id: apples.id, vendor_id: shoppers.id, user_id: alex.id)
Post.create(item_id: carrots.id, vendor_id: food_lovers.id, user_id: mark.id)
Post.create(item_id: durian.id, vendor_id: garden_market.id, user_id: alex.id)