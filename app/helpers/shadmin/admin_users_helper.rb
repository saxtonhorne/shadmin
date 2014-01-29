module Shadmin
	module AdminUsersHelper
		def user_count_paginate(users)
			"1-#{users.length} of #{users.first.class.count}"
		end
	end
end