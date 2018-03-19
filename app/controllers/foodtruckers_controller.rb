class FoodtruckersController < ApplicationController

  def index
    @foodtrucker = Foodtrucker.where(["username LIKE ?","%#{params[:search]}%"])
  end

  def generalserach
    @user_location = Userlocation.new(ip:request.location.ip)
    @user_location.save
    @nearfoodtrucks = Street.near([@user_location.latitude, @user_location.longitude, 10)
  end

  private

  def foodtrucker_params
    params.require(:foodtrucker).permit(:username, :email, :postalcode)
  end

end
