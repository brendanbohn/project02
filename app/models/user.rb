class User < ActiveRecord::Base
	has_many :connections
	has_many :posts
	has_many :groups
	has_many :children
end
