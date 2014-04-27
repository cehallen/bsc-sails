class Sail < ActiveRecord::Base
  validates :when, presence: true
  validates :details, presence: true
  validates :user, presence: true
  validates :title, presence: true

  belongs_to :user
end
