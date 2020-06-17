class SearchesController < ApplicationController
	def search
		@posts = Post.search(params[:search])
		@users = User.search(params[:search])
	end

	def Post.search(search)
		if search
			Post.where(['title LIKE ? OR body LIKE ?',"%#{search}%","%#{search}%"])
		end
	end
	def User.search(search)
		if search
			User.where(['first_name LIKE ? OR last_name LIKE ? OR email LIKE ? OR nick_name LIKE ?',"%#{search}%","%#{search}%","%#{search}%","%#{search}%"])
		end
	end
end
