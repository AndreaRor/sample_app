class UsersController < ApplicationController
  
  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
  		flash[:success] = "Inscription reussie!"
  		redirect_to user_path(@user)
  	else
      flash.now[:error] = "Erreur lors de l'Inscription"
      render 'new'	#garde les champs déjà entré @user le remet ds le form value="dddd"
  		#redirect_to signup_path
  	end
  end

  def new
  	@titre = "Inscription"
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  	@titre = @user.nom
  end

end
