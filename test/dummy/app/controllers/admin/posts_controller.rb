module Admin
	class PostsController < Shadmin::ApplicationController
		def index
			render text: '<div>Admin: Posts Index Controller</div>'
		end

		def show
			render text: '<div>Admin: Posts Show Controller</div>'
		end
	end
end