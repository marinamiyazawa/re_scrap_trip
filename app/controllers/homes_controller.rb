class HomesController < ApplicationController
	def top
	end
	def about
		render layout: false #application.html.erb
	end
end
