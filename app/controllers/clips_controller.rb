class ClipsController < ApplicationController
  def create
  	post = Post.find(params[:post_id])
  	clip = current_user.clips.build(post_id: params[:post_id])
  	clip.save!
  	redirect_to post_path(post.id)
  end

  def destroy
  	post = Post.find(params[:post_id])
  	current_user.clips.find_by(post_id: params[:post_id]).destroy!
  	redirect_to post_path(post.id)
  end
end
