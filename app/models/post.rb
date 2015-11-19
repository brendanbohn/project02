class Post < ActiveRecord::Base
  validates_length_of :title, :minimum => 3, :maximum => 200
  validates_length_of :response, :allow_blank => false
  
  post = Post.new
  post.valid?
  post.errors[:title]
  post.errors.full_messages

  belongs_to :user
  belongs_to :group

  has_many :comments
end
