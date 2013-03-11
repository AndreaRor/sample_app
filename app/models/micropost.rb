# == Schema Information
#
# Table name: microposts
#
#  id           :integer          not null, primary key
#  content      :string(255)
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  categorie_id :integer
#

class Micropost < ActiveRecord::Base
  attr_accessible :content, :categorie_id

  belongs_to :user
  has_many :commentaires, :dependent => :destroy

  default_scope :order => "microposts.created_at DESC"

  validates :user_id, :presence => true
  validates :content, :presence => true,
  					  :length => { :maximum => 150 }
  validates :categorie_id, :presence => true

  def self.from_users_followed_by(user)
    followed_ids = user.following.map(&:id).join(", ")
    where("user_id IN (?) OR user_id = ?", followed_ids, user.id)
  end

  def self.micropost_par_cat(categorie)
    where("categorie_id = ?", categorie.id)
  end
end
