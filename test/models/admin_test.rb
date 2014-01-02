require 'test_helper'

class AdminTest < ActiveSupport::TestCase
	def admin
		@admin ||= admins :adam
	end

  def test_admin_class
  	assert Object.const_defined? 'Admin'
  end

  def test_validates_email
  	admin.email = ''
  	assert_not admin.valid?
  end
end
