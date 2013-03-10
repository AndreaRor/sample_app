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

	def show_map(coordinates)
		image_tag "http://maps.googleapis.com/maps/api/staticmap?center=#{coordinates[:latitude]},#{coordinates[:longitude]}&zoom=13&size=600x400&markers=color:blue%7C#{coordinates[:latitude]},#{coordinates[:longitude]}&sensor=false"
	end
end
