class Admins::PostsController < ApplicationController
	def index
		@posts = Post.all
	end
	def show
		@post = Post.find(params[:id])
	end
	def edit
		@post = Post.find(params[:id])
	end
	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to admins_post_path
	end
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to admins_posts_path
	end

	private
	def post_params
		params.require(:post).permit(:title, :body, :rate, :status, post_images_images: [] )
	end
end
