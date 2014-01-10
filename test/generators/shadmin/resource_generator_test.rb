require 'test_helper'
require 'rails/generators/test_case'
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
	  	assert_file 'app/views/admin/blog_categories/index.html.erb'
	  	assert_file 'app/views/admin/blog_categories/show.html.erb'
	  	assert_file 'app/views/admin/blog_categories/_form.html.erb'
	  end

	  private

	  	def cleanup_temp_files
		    rm_rf destination_root
		  end
	end
end