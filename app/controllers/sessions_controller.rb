class SessionsController < ApplicationController
  
  def new
  	@titre = "Connexion"
  end

  def create
  	user = User.authenticate(params[:session][:email], params[:session][:password])
  	if user.nil?
  		flash.now[:error] = "Echec de l'identification"
  		@titre = "S'identifier"
  		render 'new'
	else
  		flash[:success] = "Identification OK"
  		sign_in user
  		redirect_to user
  	end
  end
end
