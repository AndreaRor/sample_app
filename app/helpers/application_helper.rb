module ApplicationHelper
	def titre
		titre_base = "Bienvenue sur mon site"
		if @titre.nil?
			titre_base
		else
			"#{titre_base} | @titre"
		end
	end
end
