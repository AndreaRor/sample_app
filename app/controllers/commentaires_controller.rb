class CommentairesController < ApplicationController

	before_filter :get_micropost, :only => [:index, :new]

	def index
		@titre = "Les commentaires"
		#@micropost = Micropost.find(params[:micropost_id])
		@commentaires = @micropost.commentaires
	end

	def new
		@titre = "Un nouveau commentaire"
		@commentaire = Commentaire.new
	end

	def create
		@micropost = Micropost.find(params[:commentaire][:micropost_id])
		if @micropost.nil?
			flash[:error] = "Micropost null!"
			redirect_to root_path
		end
		@commentaire = @micropost.commentaires.create(params[:commentaire])
		if !@commentaire.save
			flash.now[:error] = "Commentaire pas sauve!"
			render 'new'
		else
			#   KO -> flash[:success] = "Le commentaire a été créé"
			flash[:success] = "Le commentaire a ete cree"
		end
		redirect_to commentaires_path(:micropost_id => @micropost.id)
	end

	def destroy
		@commentaire = Commentaire.find(params[:id])
		@micropost = @commentaire.micropost
		@commentaire.destroy
		flash[:success] = "Le post a ete supprime"
		redirect_to commentaires_path(:micropost_id => @micropost.id)
	end

	def mes_commentaires
		@user = User.find(params[:id])
		@titre = "Commentaire de #{@user.nom}"
		@commentaires = @user.commentaires
	end

	private 
		def get_micropost
			@micropost = Micropost.find(params[:micropost_id])
		end

end