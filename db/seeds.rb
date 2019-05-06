#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'seeding user'
User.create(name: 'Default User', email: 'teste@mail.com', password: '123456', password_confirmation: '123456')

puts 'seeding accounts'
Account.create(description: 'Account test 1', initial_deposit: 750)
Account.create(description: 'Account test 2', initial_deposit: 250)
