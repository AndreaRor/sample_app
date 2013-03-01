module ApplicationHelper
	def titre
		titre_base = "Page"
		if @titre.nil?
			titre_base
		else
			"#{titre_base} | #{@titre}"
		end
	end

	def logo
		logo = image_tag("logo.png", :alt => "Application Exemple", :id => "logo", :class => "round")
		logo
	end 
end
