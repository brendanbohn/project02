class User < ActiveRecord::Base
	has_many :connections
	has_many :posts
  has_many :children
  has_one :questionnaire
  has_many :memberships
	has_many :groups, :through => :memberships
  has_many :compatabilities


  has_attached_file :avatar,
                    :styles => { :medium => "150x150>", :thumb => "44x44#" },
                    :default_url => "/images/:style/missing.png"

  validates_attachment :avatar, #:presence => true,
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                       :size => { :in => 0..1000.kilobytes }

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

end
