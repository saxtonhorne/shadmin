require 'fileutils'
require 'test_helper'
require 'rails/generators/shadmin/resource/resource_generator'

module Shadmin
	class ResourceGeneratorTest < Rails::Generators::TestCase
	  tests Shadmin::Generators::ResourceGenerator

	  destination File.expand_path("../tmp", File.dirname(__FILE__))
	  setup do
	  	prepare_destination
	  	copy_routes_file
	  end
	  teardown :cleanup_temp_files

	  def test_controller_template_files_created
	    run_generator ['BlogCategories']
	    assert_file "app/controllers/admin/blog_categories_controller.rb"
	  end

	  def test_view_template_files_created
	  	run_generator ['BlogCategories']
	  	%w( index show new edit _form ).each do |view|
		  	assert_file "app/views/admin/blog_categories/#{view}.html.erb"
		  end
	  end

	  def test_adds_resource_route
	  	run_generator ['BlogCategories']
	  	file = File.read File.join(destination_root, 'config/routes.rb')
	  	assert_match(/namespace :admin do\nresources :blog_categories\nend/, file)
	  end

	  private

	  	def cleanup_temp_files
		    rm_rf destination_root
		  end

		  def copy_routes_file
		  	FileUtils.mkdir_p File.join(destination_root, 'config')
		  	source_file = File.expand_path('../../../lib/rails/generators/shadmin/resource/templates/routes.rb', File.dirname(__FILE__))
				destination_file = File.join(destination_root, 'config/routes.rb')
				FileUtils.copy_file source_file, destination_file
		  end
	end
end