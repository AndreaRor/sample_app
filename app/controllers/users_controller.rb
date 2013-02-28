class UsersController < ApplicationController
  
  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "Inscription reussie!"
  		#flash[:success] = "Bienvenue dans l'Application Exemple!"
  		redirect_to user_path(@user)
  	else
  		render 'new'
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
