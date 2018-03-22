class PostsController < ApplicationController
  def create
    @post = Post.new(post_params) do |post|
      post.user = current_user
      post.foodtrucker = get_foodtrucker
    end
    if @post.save
      redirect_to showfoodtrucker_path(get_foodtrucker)
    else
      redirect_to showfoodtrucker_path(get_foodtrucker), notice: @post.errors.full_messages.first
    end
  end

  private

  def post_params
      params.permit(:content)
    end

  def get_foodtrucker
  	Foodtrucker.find(params[:foodtrucker_id])
  end
end
