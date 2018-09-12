# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

jon   = User.create! name: 'Jonathan Worthington - Teacher'
melissa = User.create! name: 'Melissa Reed - Teacher'
mariko  = User.create! name: 'Mariko Kuga - Student'
kaito   = User.create! name: 'Kaito Nakamura - Student'

Message.create! title: 'English Language', content: 'Introduction to grammar', user: jon
Message.create! title: 'Maths ', content: 'Multiplication and Division', user: melissa
