module Shadmin
	module NavHelper
		def active_nav(section)
			'active' if current_section? section
  	end

  	def current_section?(section)
  		request.path.downcase.split('/').include? section.downcase
  	end
	end
end