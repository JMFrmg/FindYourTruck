class HomeController < ApplicationController
  before_action :ensure_login, only: [:show]
  def index
  	if user_logged_in? && current_user.cart
	  	current_user.cart.destroy
	end
  	@foodtruckers = Foodtrucker.all
    @streetadresses = Street.all
  end

  def show
  	if logged_in? && !current_user.cart
    	@cart = Cart.new(name:"Ma commande")
    	current_user.cart = @cart
    	@cart.save
    end
    @foodtrucker = Foodtrucker.find(params[:id])
  	@menu = @foodtrucker.menu
  	@dishes = @menu.dishes
  	@cart = current_user.cart
  end

  def add_to_favorites
    if !current_user.favorites.include?(Foodtrucker.find(params[:id])) 
      current_user.favorites << Foodtrucker.find(params[:id])
      flash[:notice] = "Le foodtruck a été ajouté à vos favoris!"
      redirect_to showfoodtrucker_path(Foodtrucker.find(params[:id]))
    else
      flash[:notice] = "Vous avez déjà ajouté ce foodtruck à vos favoris!"
      redirect_to showfoodtrucker_path(Foodtrucker.find(params[:id]))
    end
  end

  def delete_favorite
    current_user.favorites.delete(Foodtrucker.find(params[:id]))
    redirect_to edit_user_registration_path(Foodtrucker.find(params[:id]))
  end

  

  
end
