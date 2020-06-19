class HomesController < ApplicationController
	def top
		@posts = Post.published.order("created_at DESC").limit(4)
		render layout: false #application.html.erb
	end
	def about
		render layout: false #application.html.erb
	end
end
