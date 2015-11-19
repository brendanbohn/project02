class Post < ActiveRecord::Base
  validates_length_of :title, :minimum => 3, :maximum => 200
  validates_length_of :content, :allow_blank => false
  

  belongs_to :user
  belongs_to :group

  has_many :comments
end
