class Child < ActiveRecord::Base
  belongs_to :user

  def age 
    days = Date.today - self.birthday
    years = days.to_i/ 365
  end

end
