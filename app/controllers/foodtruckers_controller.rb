class FoodtruckersController < ApplicationController

  def index
    @foodtrucker = Foodtrucker.where(["username LIKE ?","%#{params[:search]}%"])
  end

  private

  def foodtrucker_params
    params.require(:foodtrucker).permit(:username, :email, :postalcode)
  end

end
