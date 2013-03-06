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

class Commentaires < ActiveRecord::Base
  attr_accessible :contenu

  belongs_to :micropost

  
end
