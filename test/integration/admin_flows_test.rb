require 'test_helper'

class AdminFlowsTest < ActionDispatch::IntegrationTest
	# include Devise::TestHelpers
	fixtures :admins

  # def test_index
  # 	login admins(:adam)
  # 	get '/admin'
  # 	assert_response :success
  # end

  private

  	def login(user)
  		open_session do |sess|
  			sess.post '/admin/login', email: user.email, password: user.password
  		end
  	end
end
