module Shadmin
	module Generators
		class ResourceGenerator < Rails::Generators::Base
		  source_root File.expand_path('../templates', __FILE__)

		  argument :resource_name, type: :string

		  def create_shadmin_controller_file
		  	template 'controllers/shadmin_controller.rb', File.join('app/controllers/admin', "#{file_name}_controller.rb")
		  end

		  def create_shadmin_view_files
		  	%w( index show new edit _form ).each do |view|
		  		view_file = "#{view}.html.erb"
			  	template File.join('views', view_file), File.join('app/views/admin', file_name, view_file)
		  	end
		  end

		  private

		  	def file_name
		  		resource_name.underscore
		  	end
		end
	end
end