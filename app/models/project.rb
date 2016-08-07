class Project < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :user_id

  validates :mastergoal, presence: true
  validates :secondgoal, presence: true
  validates :success, presence: true
  validates :can, presence: true
  validates :how, presence: true
  validates :when, presence: true

  def editable_by?(user)
    user && user == author
  end

  def showname?
    owner_name
  end

  paginates_per 8
end
