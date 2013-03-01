class SessionsController < ApplicationController
  
  def new
  	@titre = "Connexion"
  end

  def create
  	user = User.authenticate(params[:session][:email], params[:session][:password])
  	if user.nil?     #utilisateur non trouvé
  		flash.now[:error] = "Echec de l'identification"
  		@titre = "S'identifier"
  		render 'new'
	else               #utilisateur trouvé
  		#flash[:success] = "Identification réussie" probleme avec l'accent
      flash[:success] = "Identification OK"
  		sign_in user
  		redirect_back_or(root_path)
  	end
  end

  def destroy
      flash[:success] = "Vous etes deconnecte!"
      sign_out 
      redirect_to root_path
  end
end
