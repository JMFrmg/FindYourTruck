class AdminsController < ApplicationController
  
  def index
  	@users = User.all
  	@foodtruckers = Foodtrucker.all
  end

  def edit_user
  	@user = User.find(params[:id])
  end

  def edit_foodtrucker
  	@foodtrucker = Foodtrucker.find(params[:id])
  end

end
