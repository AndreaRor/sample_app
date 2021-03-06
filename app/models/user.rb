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
#  salt               :string(255)
#  admin              :boolean          default(FALSE)
#  address            :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :nom, :address, :email, :password, :password_confirmation	#liste des attributs accessible (getter,setter)
  attr_accessor :password	#attribut virtuel

  geocoded_by :address

  has_many :microposts, :dependent => :destroy
  has_many :relationships, :foreign_key => "follower_id",
                           :dependent => :destroy
  has_many :following,:through => :relationships, :source => :followed
  has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower

  default_scope :order => "users.nom ASC"     #SELECT trié par nom


  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nom, :presence => true,
  				  :length => { :maximum => 50 }
  validates :email, :presence => true,
  					:format => { :with => email_regex }, 
  					:uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
  						:confirmation => true,	#crée automatiquement l'attribut virtuel password_confirmation
  						:length => { :within => 4..6 }
  validates :address, :presence => true

  before_save :cryptage_password

  def verif_password?(mdp_soumis)
  	encrypted_password == cryptage(mdp_soumis)
  end

  def self.authenticate(email, password)
  	user = find_by_email(email)
  	return nil if user.nil? #true si utilisateur null, pas trouvé
  	return user if user.verif_password?(password) #true si mot de passe correspond
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    #return nil if user.nil?
    #return user if(user.salt == cookie_salt)
    (!user.nil? && user.salt == cookie_salt) ? user : nil
  end

  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end

  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end

  def feed
    Micropost.from_users_followed_by(self)
  end

  #def feed
  #  Micropost.where("user_id = ?", id)
  #end

  def commentaires
    Commentaire.where("user_id = ?", id)
  end

  def get_coordinates
    geo_result = Geocoder.search(self.address)
    coordinates = { :latitude => geo_result[0].latitude, :longitude => geo_result[0].longitude}
    return coordinates
  end

  private
  	def cryptage_password
      self.salt = make_salt if new_record?
      self.encrypted_password = cryptage(password)
    end
  	def cryptage(string)
      secure_hash("#{salt}--#{string}")
  	end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end
