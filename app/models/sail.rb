class Sail < ActiveRecord::Base
  validates :when, presence: true
  validates :details, presence: true
end
