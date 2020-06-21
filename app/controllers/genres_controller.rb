class GenresController < ApplicationController
	def show
		@genre = Genre.find(params[:id])
		if @genre.ancestry == nil #@genreがancestry:nilかチェックする
			@children = Genre.where(ancestry: @genre.id) #nilの場合 @genre.idをancestryに持つジャンルをとる
		    @posts = Post.where(genre_id: @children.ids)	#そのジャンルを持つpostsをとる
		else
			@posts = @genre.posts
		end
	end
end
