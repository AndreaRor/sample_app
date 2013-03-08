class MicropostsController < ApplicationController

    before_filter :authenticate
    before_filter :authorized_user, :only => :destroy

  def create
  	@micropost = current_user.microposts.build(params[:micropost])
    puts "ID CAT #{@micropost.categorie_id}"
  	if @micropost.save
  		flash[:success] = "Micropost cree"
  		redirect_to root_path
 	  else
 		  @feedList = []
 		  flash.now[:error] = "Oups! Pas cree"
 		  render "pages/home"
 	  end
  end

  def destroy
  	@micropost.destroy
  	flash[:success] = "Post supprime!"
  	redirect_to root_path
  end

  def post_par_categorie
    @categorie = Categorie.find_by_nom(params[:categorie_nom])
    @titre = "#{@categorie.nom}"
    @microposts = Micropost.micropost_par_cat(@categorie)

  end

  private
  	def authorized_user
  		@micropost = current_user.microposts.find(params[:id])
  		redirect_to root_path if @micropost.nil?
  	end
end
