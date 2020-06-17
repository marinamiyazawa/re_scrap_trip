class GenresController < ApplicationController
	def index
		@parents = Genre.where(ancestry: nil)
	end
	def show
		@genre = Genre.find(params[:id])
		@posts = @genre.posts
	end
end
