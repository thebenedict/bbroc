# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

produce_list_file = Rails.root.join('db', 'produce_list.yml')
produce_list = YAML::load_file(produce_list_file)
produce_list.map { |item_name| tmp = Item.create(name: item_name) }