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

  

  
end
