# == Schema Information
#
# Table name: lists
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class List < ActiveRecord::Base
  attr_accessible :name

  belongs_to :user
  has_many :items, :dependent => :destroy

  validates :name, :presence => true
  validates :user_id, :presence => true

end
