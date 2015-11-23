class Compatability < ActiveRecord::Base
  has_many :users
  belongs_to :questionnaires
end
