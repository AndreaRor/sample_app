module ApplicationHelper

	def titre
		titre_base = "Bienvenue sur mon site"
		if @titre.nil?
<<<<<<< HEAD
			titre_base
=======
			@titre_base
>>>>>>> branche_structure
		else
			"#{titre_base} | @titre"
		end
	end
end
