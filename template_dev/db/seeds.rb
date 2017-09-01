# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

10.times do
  Listing.create(
    address: FFaker::AddressUS.street_address + ',' + FFaker::AddressUS.city + ',' + FFaker::AddressUS.state + ',' + FFaker::AddressUS.zip_code,
    title: FFaker::DizzleIpsum.words,
    rent: FFaker::Address.building_number,
    available_date:  Date::MONTHNAMES[1+rand(11)],
    description: FFaker::DizzleIpsum.paragraph,
    contact_phone: FFaker::PhoneNumber.phone_number,
    contact_email: FFaker::Internet.email,
    city: 'San Francisco'
  )
end
