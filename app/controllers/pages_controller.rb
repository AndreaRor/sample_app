class PagesController < ApplicationController
  def home
  	@titre = "Accueil"
    @micropost = Micropost.new if signed_in?
    @feedList = Micropost.all(:limit => 10)
  end

  def contact
	@titre = "Contact"  
  end

  def about
  	@titre = "A propos"
  end

  def help
  	@titre = "Aide"
  end
end
