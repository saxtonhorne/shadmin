module Shadmin
  module ApplicationHelper
  	def records_count_paginated(records, page=1)
			if records.any?
				klass = records.first.class
				page = page.to_i <= 1 ? 1 : page.to_i
				offset = ((page - 1) * klass.default_per_page) + 1
				"#{offset}-#{(offset + records.length) - 1} of #{klass.count}"
			end
		end
  end
end
