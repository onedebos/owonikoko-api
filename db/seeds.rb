# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Account.create!(
    name: 'test',
    bank: 'test',
    acc_no:'309039309',
    category:'yes',
    user_id:1
)

User.create!(
    id:1,
    username:'admin',
    password: 'password'
)