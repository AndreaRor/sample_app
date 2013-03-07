# == Schema Information
#
# Table name: commentaires
#
#  id           :integer          not null, primary key
#  contenu      :string(255)
#  user_id      :integer
#  micropost_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Commentaire < ActiveRecord::Base
  attr_accessible :contenu, :user_id, :micropost_id

  belongs_to :micropost

  validates :contenu, :presence => true
  #validates :micropost_id, :presence => true
  #validates :user_id, :presence => true,
  #					  :length => { :maximum => 50 }


end
