class AdminsController < ApplicationController
  def edit_users
  	@users = User.all
  end

  def edit_foodtruckers
  end

  def edit_foodtruck

  end
end
