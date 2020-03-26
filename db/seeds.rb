require 'faker'

20.times.each do
  Employee.create(name: Faker::Name.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone)
end
