# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(:name => "admin", :russian_name => "Администратор")
Role.create(:name => "user", :russian_name => "Пользователь")
Role.create(:name => "group_organizer", :russian_name => "Профорг группы")
Role.create(:name => "course_organizer", :russian_name => "Профорг курса")
Role.create(:name => "subsidy_organaizer", :russian_name => "Ответственный за матпомощь")
Role.create(:name => "transport_organaizer", :russian_name => "Ответственный за компенсацию проезда")
Role.create(:name => "paymaster", :russian_name => "Казначей")
Role.create(:name => "chairman", :russian_name => "Председатель")