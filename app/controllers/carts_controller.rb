class CartsController < ApplicationController
  before_action :ensure_user_login

  def adddish
  	@cart = current_cart
  	@dish = Dish.find(params[:id])
  	@cart.dishes << @dish
  	redirect_to showfoodtrucker_path(findfoodtruck(@dish))
  end

  def removedish
  	@cart = current_cart
  	@dish = Dish.find(params[:id])
  	@cart.dishes.delete(@dish)
  	redirect_to showfoodtrucker_path(findfoodtruck(@dish))
  end


  def buy
    require 'stripe'
    @cart = current_cart
    @dishes = @cart.dishes
    @sum = 0
    @dishes.each do |dish|
      @sum += dish.price
    end
    @amount = (@sum*100).to_i
    customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    UserMailer.buy_email(current_user, @dishes, findfoodtruck(@dishes[1])).deliver_now!
 

    flash[:success] = "Merci d'avoir commandé sur notre site! Un mail récapitulatif de votre commande vous a été envoyé"

    redirect_to root_path
  end

  private

  	def current_cart
  		current_user.cart
  	end

  	def findfoodtruck(dish)
  		dish.menu.foodtrucker
  	end

end
