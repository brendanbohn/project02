class Compatability < ActiveRecord::Base
  belongs_to :users
  belongs_to :questionnaires
end
