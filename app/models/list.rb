class List < ActiveRecord::Base
  attr_accessible :name

  belongs_to :user

  validates :name, :presence => true
  validates :user_id, :presence => true
end
