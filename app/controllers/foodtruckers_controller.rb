class FoodtruckersController < ApplicationController

  def index
    @foodtrucker = Foodtrucker.where(["username LIKE ?","%#{params[:search]}%"])
    @address = Foodtrucker.where(["username LIKE ?","%#{params[:search]}%"]).first.streetadresses.where(actual: true).last.address
  end

  def generalsearch
    #@user_location = Userlocation.new(ip:'130.79.220.86')
    #@user_location.save
    #@nearfoodtrucks = Street.near([@user_location.latitude, @user_location.longitude], 1000).where(actual: true).all
    @street = Street.all
      @hash = Gmaps4rails.build_markers(@street) do |foodtruck, marker|
        marker.lat foodtruck.latitude
        marker.lng foodtruck.longitude
      end
  end

  private

  def foodtrucker_params
    params.require(:foodtrucker).permit(:username, :email, :postalcode)
  end

end
