require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all


nb_user = 15 
nb_events = 8
nb_guests = 30


nb_user.times do |x|
  fname = Faker::Name.first_name
  User.create(
      email: fname+'@yopmail.com',
      first_name:  fname,
      password: 'azerty',
      last_name: Faker::Name.last_name,
      description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
      is_admin: false)
  puts "Seeding of User nb #{x}"
end

#for the random startdate
t1 = Time.parse("2019-11-01 14:40:34")
t2 = Time.parse("2022-01-01 00:00:00")

nb_events.times do |x|
  Event.create(
    start_date: rand(t1..t2),
    duration: rand(5..100)*5,
    description: Faker::Lorem.paragraph_by_chars(number: 300, supplemental: false),
    location: Faker::Address.city,
    price: rand(1..1000),
    title: Faker::Book.title,
    admin_id: User.all.sample.id)
  puts "Seeding of Event nb #{x}"
end

nb_guests.times do |x|
  Attendance.create(
    participant_id: User.all.sample.id,
    event_id: Event.all.sample.id)
  puts "Seeding of Attendance nb #{x}"
end

