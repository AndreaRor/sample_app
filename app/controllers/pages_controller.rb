class PagesController < ApplicationController
  def home
  	@titre = "Accueil"
    if signed_in? 
      @micropost = Micropost.new
      @feedList = current_user.feed
    end
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
