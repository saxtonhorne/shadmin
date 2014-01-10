module Shadmin
	module Generators
		class ResourceGenerator < Rails::Generators::Base
		  source_root File.expand_path('../templates', __FILE__)

		  argument :resource_name, type: :string

		  def copy_shadmin_controller_file
		  	template 'shadmin_controller.rb', File.join('app/views/admin', "#{file_name}_controller.rb")
		  end

		  private

		  	def file_name
		  		resource_name.underscore
		  	end
		end
	end
end