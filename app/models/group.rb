class Group < ActiveRecord::Base
  has_many :posts
  has_many :users
end
