class UsersController < ApplicationController

  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]

  def index
    @users = User.all
    #@users = User.paginate(:page => params[:page])
    @titre = "Liste des utilisateurs"
  end

  def new
    @titre = "Inscription"
    @user = User.new
  end

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

  def update
    #@user = User.find(params[:id])      @user est défini par la fonction filtre correct_user
    if @user.update_attributes(params[:user])
        flash[:success] = "Pofil mis a jour"
        redirect_to @user
    else
        flash.now[:error] = "Probleme pour editer le profil"
        @titre = "Editer profil"
        render 'edit'
    end
  end 

  def show
  	@user = User.find(params[:id])
  	@titre = @user.nom
  end

  def edit
    #@user = User.find(params[:id])     @user est défini par la fonction filtre correct_user
    @titre = "Editer profil"
  end

  def authenticate
    deny_access unless signed_in?     # code unless condition  -> execute le code si condition == false
  end

  def correct_user
    @user = User.find(params[:id])
    if(!current_user?(@user))
      flash[:error] = "Vous ne pouvez modifier que votre profil"
      redirect_to root_path
    end

  end
end
