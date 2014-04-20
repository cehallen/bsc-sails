class Sailor < ActiveRecord::Base
  validates :first_name, presence: true
  validates :details, presence:true
end
