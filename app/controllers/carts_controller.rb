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

   def addsidedish
    @cart = current_cart
    @sidedish = Sidedish.find(params[:id])
    @cart.sidedishes << @sidedish
    redirect_to showfoodtrucker_path(@sidedish.menu.foodtrucker)
  end

  def removesidedish
    @cart = current_cart
    @sidedish = Sidedish.find(params[:id])
    @cart.sidedishes.delete(@sidedish)
    redirect_to showfoodtrucker_path(@sidedish.menu.foodtrucker)
  end

   def adddrink
    @cart = current_cart
    @drink = Drink.find(params[:id])
    @cart.drinks << @drink
    redirect_to showfoodtrucker_path(@drink.menu.foodtrucker)
  end

  def removedrink
    @cart = current_cart
    @drink = Drink.find(params[:id])
    @cart.drinks.delete(@drink)
    redirect_to showfoodtrucker_path(@drink.menu.foodtrucker)
  end

  def adddesert
    @cart = current_cart
    @desert = Desert.find(params[:id])
    @cart.deserts << @desert
    redirect_to showfoodtrucker_path(@desert.menu.foodtrucker)
  end

  def removedesert
    @cart = current_cart
    @desert = Desert.find(params[:id])
    @cart.deserts.delete(@desert)
    redirect_to showfoodtrucker_path(@desert.menu.foodtrucker)
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

    UserMailer.buy_email(current_user, @cart, @sum, findfoodtruck(@dishes[1])).deliver_now!
 

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
