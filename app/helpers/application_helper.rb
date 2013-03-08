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

	def show_map(address)
		geo_result = Geocoder.search(address)
		image_tag "http://maps.googleapis.com/maps/api/staticmap?center=#{geo_result[0].latitude},#{geo_result[0].longitude}&zoom=13&size=1000x200&markers=color:blue%7C#{geo_result[0].latitude},#{geo_result[0].longitude}&sensor=false"
	end

end
