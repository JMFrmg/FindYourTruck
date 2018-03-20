class FoodtruckersController < ApplicationController

  def index
    @foodtrucker = Foodtrucker.where(["username LIKE ?","%#{params[:search]}%"])
    @address = Foodtrucker.where(["username LIKE ?","%#{params[:search]}%"]).first.streetadresses.where(actual: true).last.address
  end

  def generalserach
    #@user_location = Userlocation.new(ip:request.location.ip)
    @user_location = Userlocation.new(ip:" 130.79.220.86")
    @user_location.save
    @nearfoodtrucks = Street.near([@user_location.latitude, @user_location.longitude], 10)

  end

  def edit
    @addresses = Foodtrucker.find(params[:id]).streetadresses
  end

  def update
  end

  def addaddress
    @address = Street.new
    @address.address = params[:address]
    @address.foodtrucker = Foodtrucker.find(params[:id])
    @address.save
    redirect_to edit_foodtrucker_path
  end

  def beactual
    @street = Street.find(params[:id])
    @street.actual = true
    @street.save
    redirect_to edit_foodtrucker_path
  end

  private

  def foodtrucker_params
    params.require(:foodtrucker).permit(:username, :email, :postalcode)
  end

end
