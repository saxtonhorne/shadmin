module Shadmin
  module MessageHelper
  	def build_message(msg, obj)
  		[msg, obj.errors.full_messages.join('. ') + '.'].reject(&:blank?).join(' ')
  	end
  end
end