# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

increase_experience_point = 100
need_experience_point = 100
for i in 1..10 do
  RunExperience.create(
  run_level:i, need_experience_point:need_experience_point
)
  increase_experience_point = increase_experience_point * 1.1
  need_experience_point += increase_experience_point
end
