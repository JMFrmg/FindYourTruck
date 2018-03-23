class HomeController < ApplicationController
  before_action :ensure_user_login, only: [:show, :add_to_favorites, :delete_favorite]
  def index
  	if user_logged_in? && current_user.cart
	  	current_user.cart.destroy
	end
  	@foodtruckers = Foodtrucker.all
    @streetadresses = Street.all
    @photos = Photo.all
  end

  def show
  	if user_logged_in?
      if !current_user.cart
    	  @cart = Cart.new(name:"Ma commande")
    	  current_user.cart = @cart
    	  @cart.save
      end
    end
    @foodtrucker = get_foodtrucker
  	@menu = @foodtrucker.menu
  	@dishes = @menu.dishes
  	@cart = current_user.cart
    @post = Post.new
    @posts = get_foodtrucker.posts
  end

  def add_to_favorites
    if !current_user.favorites.include?(get_foodtrucker)
      current_user.favorites << get_foodtrucker
      flash[:notice] = "Le foodtruck a été ajouté à vos favoris!"
      redirect_to showfoodtrucker_path(get_foodtrucker)
    else
      flash[:notice] = "Vous avez déjà ajouté ce foodtruck à vos favoris!"
      redirect_to showfoodtrucker_path(get_foodtrucker)
    end
  end

  def delete_favorite
    current_user.favorites.delete(get_foodtrucker)
    redirect_to edit_user_registration_path(get_foodtrucker)
  end

private
  def get_foodtrucker
    Foodtrucker.find(params[:id])
  end


end
