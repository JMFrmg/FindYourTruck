class FoodtruckersController < ApplicationController

  def index
    @foodtrucker = Foodtrucker.where(["username LIKE ?","%#{params[:search]}%"])
    @address = Foodtrucker.where(["username LIKE ?","%#{params[:search]}%"]).first.streetadresses.where(actual: true).last.address
  end

  def generalserach
    #@user_location = Userlocation.new(ip:request.location.ip)
    @user_location = Userlocation.new(ip:" 130.79.220.86")
    @user_location.save
    @nearfoodtrucks = Street.near([@user_location.latitude, @user_location.longitude], 10])
  end

  private

  def foodtrucker_params
    params.require(:foodtrucker).permit(:username, :email, :postalcode)
  end

end
