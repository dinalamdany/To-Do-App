# == Schema Information
#
# Table name: items
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  list_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Item < ActiveRecord::Base
  attr_accessible :content

  belongs_to :list

  validates :content, :presence => true
  validates :list_id, :presence =>true

  default_scope :order => 'items.created_at ASC'
end
