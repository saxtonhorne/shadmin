require 'test_helper'

module Shadmin
  class AdminUsersHelperTest < ActionView::TestCase

  	def test_user_count
  		admins = create_list(:admin, 12)
  		assert_equal '1-12 of 12', user_count_paginate(admins)
  	end
  end
end
