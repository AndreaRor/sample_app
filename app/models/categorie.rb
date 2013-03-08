# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  nom        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Categorie < ActiveRecord::Base
	attr_accessible :nom

	has_many :microposts
end
