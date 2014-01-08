require 'test_helper'

module Shadmin
  class AdminTest < ActiveSupport::TestCase

		def admin
			@admin ||= Admin.create(email: 'adam@example.com', password: 'password', password_confirmation: 'password')
		end

	  def test_validates_email
	  	assert admin.valid?
	  	admin.email = 'peter'
	  	assert_not admin.valid?
	  end

	  def test_validates_password_length_min
	  	assert admin.valid?
	  	admin.password = 'a' * 7
	  	assert_not admin.valid?
	  end

	  def test_validates_password_length_max
	  	assert admin.valid?
	  	admin.password = 'a' * 129
	  	assert_not admin.valid?
	  end

	  # def test_validates_email_uniqueness
	  # 	assert admin.valid?
	  # 	admin.email = admins(:bob).email
	  # 	assert_not admin.valid?
	  # end
	end
end
