# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  nom                :string(255)
#  email              :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encrypted_password :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :nom, :email, :password, :password_confirmation	#liste des attributs accessible (getter,setter)
  attr_accessor :password	#attribut virtuel

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nom, :presence => true,
  				  :length => { :maximum => 20 }
  validates :email, :presence => true,
  					:format => { :with => email_regex }, 
  					:uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
  						:confirmation => true,	#crée automatiquement l'attribut virtuel password_confirmation
  						:length => { :within => 4..6 }

  before_save :cryptage_password


  def verif_password?(mdp_soumis)
  	encrypted_password == cryptage(mdp_soumis)
  end

  def self.authenticate(email, password)
  	user = find_by_email(email)
  	return nil if user.nil? #true si utilisateur null, pas trouvé
  	return user if user.verif_password(password) #true si mot de passe correspond
  end

  private
  	def cryptage_password
  	  	self.encrypted_password = cryptage(password)
  	end
  	def cryptage(string)
  		string
  	end

end