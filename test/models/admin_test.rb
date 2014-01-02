require 'test_helper'

class AdminTest < ActiveSupport::TestCase
	def admin
		@admin ||= admins :adam
	end

  def test_admin_class
  	assert Object.const_defined? 'Admin'
  end

  def test_validates_email
  	admin.email = 'peter'
  	assert_not admin.valid?
  end

  def test_validates_password_length_min
  	admin.password = 'a' * 7
  	assert_not admin.valid?
  end

  def test_validates_password_length_max
  	admin.password = 'a' * 129
  	assert_not admin.valid?
  end
end
