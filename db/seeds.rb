# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
t1 = Todo.create(title: "Todo 1 Title", description: "Todo 1 Description")
Item.create(description: "Todo 1 / Item 1", todo: t1)
Item.create(description: "Todo 1 / Item 2", todo: t1)
t2 = Todo.create(title: "Todo 2 Title", description: "Todo 2 Description")
Item.create(description: "Todo 2 / Item 1", todo: t2)
Item.create(description: "Todo 2 / Item 2", todo: t2)