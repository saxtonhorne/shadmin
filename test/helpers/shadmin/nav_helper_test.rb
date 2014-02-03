require 'test_helper'

module Shadmin
  class NavHelperTest < ActionView::TestCase
  	def request
  		@request = OpenStruct.new(path: '/admin/admin_users/1')
  	end

  	def test_current_section?
  		refute current_section?('locations')
  		assert current_section?('admin_Users')
  	end

  	def test_active_nav
  		assert_equal 'active', active_nav('admin_users')
  		assert_not_equal 'active', active_nav('locations')
  	end
  end
end