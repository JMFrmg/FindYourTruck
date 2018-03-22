class PostsController < ApplicationController
  def create
    @post = Post.new(post_params) do |post|
      post.user = current_user
      post.foodtrucker = get_foodtrucker_by_ft_id
    end
    if @post.save
      redirect_to showfoodtrucker_path(get_foodtrucker_by_ft_id)
    else
      redirect_to showfoodtrucker_path(get_foodtrucker_by_ft_id), notice: @post.errors.full_messages.first
    end
  end

  def upvote 
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to showfoodtrucker_path(get_foodtrucker_by_post)
  end  

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_to showfoodtrucker_path(get_foodtrucker_by_post)
  end

  private

  def post_params
      params.permit(:content)
    end

  def get_foodtrucker_by_post
  	Post.find(params[:id]).foodtrucker
  end

  def get_foodtrucker_by_ft_id
  	Foodtrucker.find(params[:foodtrucker_id])
  end
end
