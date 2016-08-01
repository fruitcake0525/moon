class Dream < ActiveRecord::Base
  validates :mastergoal, presence: true
  validates :secondgoal, presence: true
  validates :success, presence: true
  validates :can, presence: true
  validates :how, presence: true
  validates :when, presence: true
end
