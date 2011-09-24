# == Schema Information
#
# Table name: microposts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Micropost < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user

  validates :content, :presence => true, :length => { :maximum => 140}
  validates :user_id, :presence => true

  default_scope :order => 'microposts.created_at DESC'

  scope :from_users_followed_by, lambda{ |user| followed_by(user)}

  private

#  def self.followed_by(user)
#    following_ids = user.following_ids
#    where("user_id IN (#{following_ids}) OR user_id = ?", user)
#  end

  def self.from_users_followed_by(user)
    where(:user_id => user.following_ids.push(user))
  end
end


