# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'ffaker' 

User.destroy_all
Questionnaire.destroy_all



10.times do 

  # build the user params
  user_params = Hash.new
  user_params[:full_name] = FFaker::Name.name
  user_params[:city] = FFaker::Address.city
  user_params[:password]  = "12345"
  user_params[:email] = FFaker::Internet.email
  user_params[:bio] = FFaker::Lorem.paragraph(3)
  user_params[:username] = FFaker::Name.first_name
  
  # save the user
  new_user = User.create(user_params)
  puts new_user
  puts new_user.full_name

  # seeds for questionnaire form
  1.times do

    new_questionnaire = Questionnaire.new     
    new_questionnaire.question1 = rand(1..4)
    new_questionnaire.question2 = rand(1..4)
    new_questionnaire.question3 = rand(1..4)
    new_questionnaire.question4 = rand(1..4)
    new_questionnaire.question5 = rand(1..4)
    new_questionnaire.save
    new_user.questionnaire = new_questionnaire
  end

end