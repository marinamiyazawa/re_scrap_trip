class PostsController < ApplicationController
	def new
		@post = Post.new
		@post.post_images.build
	end
	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@user = current_user
		@post.save
		redirect_to post_path(@post)
	end
	def index
		@post = Post.all
		@user = current_user
	end
	def show
		@post = Post.find(params[:id])
		@user = @post.user

	end
	def edit
	end
	def update
	end

	private
	def post_params
		params.require(:post).permit(:title, :body, :rate, :genre_id, post_images_images: [])
	end
end
