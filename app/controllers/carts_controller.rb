class CartsController < ApplicationController
  before_action :ensure_login

  def adddish
  	@cart = current_cart
  	@dish = Dish.find(params[:id])
  	@cart.dishes << @dish
  	redirect_back(fallback_location: foodtruck(@dish))
  end

  def removedish
  	@cart = current_cart
  	@dish = Dish.find(params[:id])
  	@cart.dishes.delete(@dish)
  	redirect_back(fallback_location: foodtruck(@dish))
  end

  def destroy
  	@cart = current_cart
  	@cart.destroy

  private

  	def current_cart
  		current_user.cart
  	end

  	def foodtruck(dish)
  		dish.foodtruck
  	end

end
