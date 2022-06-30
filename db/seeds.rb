require 'faker'

User.destroy_all
Product.destroy_all
Order.destroy_all

10.times do
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        address: Faker::Address.street_address,
        zipcode: "13390",
        phone: Faker::PhoneNumber.cell_phone_in_e164,
    )
end

puts " ---------- users created ------------"

5.times do
 product =  Product.create(
        name: Faker::Games::Pokemon.name,
        price: 10,
        country: Faker::Games::Pokemon.location,
        description: Faker::Lorem.sentence,
        stock: 99,
        year: 2021,
        condition: "neuf",
        user_id: User.last.id
    )
    product.image.attach(io: File.open(Rails.root.join('app/assets/images/images.jpeg')),
     filename: 'images.jpeg')
end

puts " ---------- products created ------------"


6.times do
    Order.create(
       quantity: [0, 1, 2, 3, 4, 5].sample, 
       user_id: User.last.id,
       product_id: Product.last.id
    )
end

puts " ---------- orders created ------------"
