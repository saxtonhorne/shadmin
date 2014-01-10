require 'test_helper'
require 'rails/generators/shadmin/resource/resource_generator'

module Shadmin
	class ResourceGeneratorTest < Rails::Generators::TestCase
	  tests Shadmin::Generators::ResourceGenerator

	  destination File.expand_path("../tmp", File.dirname(__FILE__))
	  setup :prepare_destination
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

	  private

	  	def cleanup_temp_files
		    rm_rf destination_root
		  end
	end
end