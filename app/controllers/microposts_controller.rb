class MicropostsController < ApplicationController

    before_filter :authenticate
    before_filter :authorized_user, :only => :destroy

  def create
  	@micropost = current_user.microposts.build(params[:micropost])
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

  private
  	def authorized_user
  		@micropost = current_user.microposts.find(params[:id])
  		redirect_to root_path if @micropost.nil?
  	end
end
