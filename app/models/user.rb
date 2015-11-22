class User < ActiveRecord::Base
	has_many :connections
	has_many :posts
  has_many :children
  has_one :questionnaire
  has_many :memberships
	has_many :groups, :through => :memberships


  extend FriendlyId
  friendly_id :username, use: :slugged

  has_secure_password
  validates :email, uniqueness: true
  validates_length_of :full_name, :allow_blank => false
  validates_length_of :username, :allow_blank => false
  validates_length_of :city, :allow_blank => false


  user = User.new
  user.valid? 
  user.errors[:email]
  user.errors.full_messages

  user.errors.clear
  user.errors.empty? 
  # def a_method_used_for_validation_purposes
  #   errors.add(:email, "Email is already taken!")
  # end

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

  # def image
  #   image || "5.png"
  # end


  def add_default_image
    # if value.blank?
    #   write_attribute :image, "/images/5.png"
    # else
    #   write_attribute :image, value
    # end
  
    image = "5.png" if image.blank?
    save
  end
end
