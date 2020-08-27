# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
roles = ["teacher", "ta", "student"]
10.times do
  course = Course.create(
    name: Faker::Educator.course_name,
  )

  10.times do
    user = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
    )

    Enrollment.create(
      role: roles.sample,
      course_id: course.id,
      user_id: user.id,
    )
  end
end

puts "Data Seeded."

# course1 = Course.create(name:'Science')

# Enrollment.create(role:'teacher', course_id:course1.id, user_id:1)
