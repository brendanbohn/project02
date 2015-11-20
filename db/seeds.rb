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
Child.destroy_all
Post.destroy_all
Group.destroy_all

10.times do 

  # build the user params
  user_params = Hash.new
  user_params[:full_name] = FFaker::Name.name
  user_params[:city] = FFaker::Address.city
  user_params[:password]  = "12345"
  user_params[:email] = FFaker::Internet.email
  user_params[:bio] = FFaker::Lorem.paragraph(3)
  user_params[:username] = FFaker::Name.first_name
  user_params[:image] = FFaker::Avatar.image
  
  # save the user
  new_user = User.create(user_params)
  p new_user
  p new_user.id
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

  #three children seeded for each user
  3.times do
    new_child = Child.new puts @ßchild
    new_child.name = FFaker::Name.first_name
    new_child.birthday = FFaker::Time.date
    new_child.bio = FFaker::Lorem.sentence(1)
    new_child.gender = FFaker::Identification.gender
    new_child.user_id = new_user.id
    new_child.image = FFaker::Avatar.image
    new_child.save
  end

  # seeds for posts
  5.times do

    new_post = Post.new
    new_post.title = FFaker::Movie.title
    new_post.content = FFaker::Lorem.paragraph(4)
    new_post.author = new_user.username
    new_post.group_id = rand(1..4)
    new_post.save
    new_user.posts.push new_post
  end


end

groups = Group.create([{ name: 'Carpool Divas', description: "moms and dads that love to drive their kids and others everywhere"}, { name: 'Punishment Preventers', description: 'Helping parents find ways to correct a childs bad behavior, through non violent ways' }, {name: 'Kids and Pets', description: 'community members that will watch your dog and your child while you are gone'}, {name: 'No Time', description: 'No time to help but want to be involved somehow'}])




