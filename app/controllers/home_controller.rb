class HomeController < ApplicationController
  def index
  	@foodtruckers = Foodtrucker.all
  end

  def show
  	@foodtrucker = Foodtrucker.find(params[:id])
  	@menu = @foodtrucker.menu
  	@dishes = @menu.dishes
  end
end
