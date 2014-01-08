require 'test_helper'

module Shadmin
  class AdminTest < ActiveSupport::TestCase

		def setup
			@admin ||= build(:admin)
		end

	  def test_validates_email
	  	assert @admin.valid?
	  	@admin.email = 'peter'
	  	assert_not @admin.valid?
	  end

	  def test_validates_password_length_min
	  	assert @admin.valid?
	  	@admin.password = 'a' * 7
	  	assert_not @admin.valid?
	  end

	  def test_validates_password_length_max
	  	assert @admin.valid?
	  	@admin.password = 'a' * 129
	  	assert_not @admin.valid?
	  end

	  def test_validates_email_uniqueness
	  	assert @admin.valid?
	  	new_admin = create(:admin, email: 'bob@example.com')
	  	@admin.email = new_admin.email
	  	assert_not @admin.valid?
	  end
	end
end
