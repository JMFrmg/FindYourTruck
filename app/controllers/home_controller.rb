class HomeController < ApplicationController
  before_action :ensure_user_login, only: [:add_to_favorites, :delete_favorite]

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
      @cart = current_user.cart
      @cart.save
    else
      @cart = Cart.new(name:"Ma commande")
    end
    @foodtrucker = get_foodtrucker("id")
  	@menu = @foodtrucker.menu
  	@dishes = @menu.dishes
    @post = Post.new
    @posts = get_foodtrucker("id").posts
  end

  def add_to_favorites
    if !current_user.favorites.include?(get_foodtrucker("id"))
      current_user.favorites << get_foodtrucker("id")
      flash[:notice] = "Le foodtruck a été ajouté à vos favoris!"
      redirect_to showfoodtrucker_path(get_foodtrucker("id"))
    else
      flash[:notice] = "Vous avez déjà ajouté ce foodtruck à vos favoris!"
      redirect_to showfoodtrucker_path(get_foodtrucker("id"))
    end
  end

  def delete_favorite
    current_user.favorites.delete(get_foodtrucker("id"))
    redirect_to edit_user_registration_path(get_foodtrucker("id"))
  end

  private

  def foodtrucker_params
    params.require(:foodtrucker).permit(:username, :email, :postalcode)
  end

end
