class PostsController < ApplicationController
	before_action :correct_user, only:[:edit]

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
		@posts = Post.published.order("created_at DESC")
	end

	def show
		@post = Post.find_by(id: params[:id])

		if @post.nil?
			redirect_to root_path
		elsif @post.draft?
			login_required
		end
	end

	def login_required
		redirect_to user_session_path unless current_user
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to @post
	end

	def confirm
		@posts = Post.draft.where(:user_id => current_user.id).order("created_at DESC")
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private
	def post_params
		params.require(:post).permit(:title, :body, :rate, :status, :genre_id, post_images_images: [])
	end

	def correct_user
		@post = Post.find(params[:id])
		if @post.user != current_user
			redirect_to posts_path
		end
	end
end
