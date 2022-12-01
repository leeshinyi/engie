# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '>>>>> Initializing Users'
# Initialize user
30.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.first_name,
    email: Faker::Internet.email,
    mobile: Faker::PhoneNumber.cell_phone_with_country_code,
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    postcode: Faker::Address.postcode,
    country: Faker::Address.country
  )
end

puts '>>>>> Initializing Extended Attributes'
# Initialize extended attributes
# Add extended attributes to only half of the user data for sampling
users = User.all
users.each_with_index do |user, i|
  next if i.even?

  extended_fields = [
    ['name', Faker::Name.name],
    ['phone', Faker::PhoneNumber.phone_number_with_country_code],
    ['capacity', rand(10..75)]
  ].sample(2)

  extended_fields.each do |extended_field|
    user.extended_attributes.create(
      field: extended_field[0],
      value: extended_field[1],
      partner: %i[partner_1 partner_2].sample
    )
  end
end
