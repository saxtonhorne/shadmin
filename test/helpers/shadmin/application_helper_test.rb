require 'test_helper'

module Shadmin
  class ApplicationHelperTest < ActionView::TestCase

  	def test_records_count_paginated
  		Kaminari.config.default_per_page = 5
  		admins = create_list(:admin, 12)
  		assert_equal '1-5 of 12', records_count_paginated(admins[0,5], 1)
  		assert_equal '6-10 of 12', records_count_paginated(admins[0,5], 2)
  		assert_equal '11-12 of 12', records_count_paginated(admins[0,2], 3)
  	end
  end
end
