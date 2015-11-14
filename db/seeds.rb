# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.find_or_create_by(name: 'twix', quantity: 8, price: 50)
Product.find_or_create_by(name: 'mars', quantity: 8, price: 50)
Product.find_or_create_by(name: 'kitkat', quantity: 8, price: 60)
Product.find_or_create_by(name: 'skips', quantity: 5, price: 70)
Product.find_or_create_by(name: 'doritos', quantity: 5, price: 70)
Product.find_or_create_by(name: 'walkers', quantity: 5, price: 100)
